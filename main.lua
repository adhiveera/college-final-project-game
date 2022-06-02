-- main.lua
local relayout = require('relayout')
local functions = require('functions')
local boxes = require("boxes")
local map = require("map")

-- Variables
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY
local all_boxes = boxes.all_boxes
local whatever = map.all_one_way_junctions

function moveBox( direction, box )
    
    if direction == "down" then
        box.y = box.y + 1
    end

    if direction == "up" then
        box.y = box.y - 1
    end

    if direction == "right" then
        box.x = box.x + 1
    end

    if direction == "left" then
        box.x = box.x - 1
    end

    if direction == "none" then
        --do nothing 
    end
end

function listener( event )
    boxes.spawnBoxes()
    timer.cancelAll()
    timer.performWithDelay( 5000, listener )
end
timer.performWithDelay( 5000, listener )

function setNextDestination( box, destination )

    local destination_object = destination.object
    local destination_type = destination.type
    local box_object = box.object

    -- Box's coordinates 
    local box_x = box_object.x
    local box_y = box_object.y

    -- Next junction point coordinates
    local junction_x = destination_object.x
    local junction_y = destination_object.y

    -- If it is one way then set destination to next
    if destination_type == "one-way" then
        local index = destination.next[1]
        local type = destination.next[2]
        box.destination[1] = index
        box.destination[2] = type
    end

    -- If it is two then set destination based on user in put
   if destination_type == "two-way" then
       local tmp = destination.next[destination.direction]
       destination = tmp
   end
   -- Check if the box has reached an end point
   if destination_type == "end" then
        print("sdf")
       box_x = -110
       box_y = -160
       box.state = "OFF"
   end
end

local function update()    

    local length = #all_boxes
    for i = 1, length do
        local box = all_boxes[i]
        local state = box.state
        --local destination = whatever[box.destination]
        
        if state == "ON" then
            local direction = boxes.checkMoveDirection(box)
            if direction == "none" then
                setNextDestination(box, functions.decipherDestination(box.destination))
            end
            moveBox(direction, box.object )
        end    
    end
end

-- INPUT

Runtime:addEventListener("enterFrame", update)

-- Touch 
--[[local function touchListener( event )
    
    if event.phase == "ended" then 
        functions.changeJunctionDirection(event.target)
    end
end

Runtime:addEventListener("touch", touchListener)
--function startGame()
    --spawnBoxes--]]