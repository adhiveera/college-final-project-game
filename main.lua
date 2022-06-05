-- main.lua
local relayout = require('relayout')
local functions = require('functions')
local boxes = require('boxes')
local map = require('map')

-- Variables
start = 0
score = 0

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
    start = 1
    timer.cancelAll()
    timer.performWithDelay( 5000, listener )
end
timer.performWithDelay( 5000, listener )

function setNextDestination( box, destination )

    local destination_coordinates = destination.coordinates
    local destination_type = destination.type
    local box_object = box.object

    -- Box's coordinates 
    local box_x = box_object.x
    local box_y = box_object.y

    -- Next junction point coordinates
    local junction_x = destination_coordinates[1]
    local junction_y = destination_coordinates[2]

    -- If it is one way then set destination to next
    if destination_type == "one-way" then
        local type = destination.next[1]
        local index = destination.next[2]
        box.destination[1] = type
        box.destination[2] = index
    end

    -- If it is two then set destination based on user in put
    if destination_type == "two-way" then
        
        local tmp = destination.next[destination.object.direction]
        local index = tmp[1]
        local type = tmp[2]
        box.destination[1] = index
        box.destination[2] = type
    end

   -- Check if the box has reached an end point
   if destination_type == "end" then
       box.object.x = -110
       box.object.y = -160
       box.destination[1] = "o"
       box.destination[2] = 1
       box.state = "OFF"

        if box.colour == destination.colour then
            score = score + 1
        else
            score = score - 1
        end
        print(score)
    end
end

function update()    

    
    if start == 1 then
        local all_boxes_on = {}
        for key, value in pairs(boxes.all_boxes) do
            if value.state == "ON" then
                table.insert(all_boxes_on, value)
            end
        end

        local length = #all_boxes_on
        for i = 1, length do
            local box = all_boxes_on[i]
            local state = box.state
            
            if state == "ON" then
                local direction = boxes.checkMoveDirection(box)
                if direction == "none" then
                    setNextDestination(box, functions.decipherDestination(box.destination))
                end
                moveBox(direction, box.object )
            end    
        end
    end
end

Runtime:addEventListener("enterFrame", update)
counter = 0
-- Touch 
function touchListener( event )
    counter = counter +1
    if event.phase == "ended" then 
        functions.changeJunctionDirection( event.target, counter )
        print( "Object tapped: " .. tostring(event.target) )
    end
end

map.junction_tw_2.object:addEventListener("touch", touchListener)
map.junction_tw_1.object:addEventListener("touch", touchListener)
map.junction_tw_3.object:addEventListener("touch", touchListener)
map.junction_tw_4.object:addEventListener("touch", touchListener)
map.junction_tw_5.object:addEventListener("touch", touchListener)
map.junction_tw_6.object:addEventListener("touch", touchListener)
map.junction_tw_7.object:addEventListener("touch", touchListener)

--function startGame()
    --spawnBoxes--]]