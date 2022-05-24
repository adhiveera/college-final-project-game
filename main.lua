-- main.lua
local relayout = require("relayout")
-- 
-- layout
local _W, _H, _CX, _CY = relayout._W, relayout._H, 
relayout._CX, relayout._CY

--
-- Variables --
local junctionX = 0
local junctionY = 0

-- Junction points
local B = {x = 170, y = 270, next = C}
local C = {x = 170, y = 240, next = D}
local D = {x = 220, y = 240, next = E}
local E = {x = 220, y = 240, next = F}
local F = {}
--
-- Box properties
local box  = display.newRect(100, 200, 20, 20)
box.fill = {0, 1, 0}
local boxNode = { box, display.newRect(100,270,30,30)}

--
-- Move function
local function moveBox( direction )

    print(direction)
    if string.match(direction, "down") then
        box.y = box.y+1
    end

    if string.match(direction, "up") then
        box.y = box.y-1
    end

    if string.match(direction, "right") then
        box.x = box.x+1
        print("right")
    end

    if string.match(direction, "left") then
        box.x = box.x-1
        print("left")
    end
end

local function update()

    junctionX = boxNode[2].x
    junctionY = boxNode[2].y
    print(junctionX .. junctionY)
    --Checking which direction to move box, horizontally or vertically.
    if box.x == junctionX then 
        if box.y < junctionY then
            moveBox("down")
        elseif box.y > junctionY then
            moveBox("up")
        end
    end

    if box.y == junctionY then 
        print(box.x .. junctionX)
        if box.x < junctionX then
            print("fuck")
            moveBox("right")
        elseif box.x > junctionX then
            print("fucking")
            moveBox("left")
        end
    end

    if box.x == junctionX and box.y == junctionY then
        boxNode[2] = boxNode[2].next
        --print(boxNode[2].x .. boxNode[2].Y)
    end
end

Runtime:addEventListener("enterFrame", update)

--
-- Touch 
local function touch( event )

    print(boxNode[2][1])
    if x == A[1] then
        --[[while( y ~= A[2])
        do
            y < A[2] ? (y = y + 1 ) : (y = y - 1 )
        end--]]
    end
    if event.phase == "began" then 
        box.velocity = 10
    end
end

Runtime:addEventListener("touch", touch)