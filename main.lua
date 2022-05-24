-- main.lua
local relayout = require('relayout')
local functions = require('functions')
local boxes = require("boxes")
local map = require("map")

-- layout module variables
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY
all_boxes = boxes.all_boxes
local pure = all_boxes[1].object


function moveBox( direction, box )
    
    if string.match(direction, "down") then
        box.y = box.y + 1
        print("fuck");
    end

    if string.match(direction, "up") then
        box.y = box.y - 1
    end

    if string.match(direction, "right") then
        box.x = box.x + 1
    end

    if string.match(direction, "left") then
        box.x = box.x - 1
    end
end

function update()
    --if startgame == true or smth then 
    --startGame()
    --print(os.clock())
    boxes.spawnBoxes() --number will come
    local length = #all_boxes
    for i = 1, length do
        local box = all_boxes[i]
        local state = box.state
        if state == "ON" then
            --local direction = boxes.checkMoveDirection()
            moveBox( "down", box.object )
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