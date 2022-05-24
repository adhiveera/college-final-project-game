local functions = require('functions')
local map = require('map')
local M = {}

-- Creation of inactive boxes
M.green_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "ON"}
M.green_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.red_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.red_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.blue_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.blue_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.white_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.white_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.yellow_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.yellow_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.orange_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.orange_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.pink_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.pink_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.purple_a = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}
M.purple_b = {object = display.newRect(110, 160, 20, 20), destination = map.JUNCTION_OW_1, state = "OFF"}

-- Table of all inactive boxes ready for deployment
M.all_boxes = {M.green_a, M.green_b, M.red_a, M.red_b, M.blue_a, M.blue_b, M.white_a, M.white_b, M.yellow_a, M.yellow_b, 
               M.orange_a, M.orange_b, M.pink_a, M.pink_b, M.purple_a, M.purple_b}

-- Variables assisting with random value generator
--M.prev_random = 0;
--M.random = 0

-- Spawning boxes on the map and calling move function
function M.spawnBoxes()
    -- Getting a random value 
    --local random_value = functions.properRandomValue( M.prev_random )
    local random_value = math.random( 16 )
    --M.prev_random = random_value
    print(random_value)
    -- Repeat until finding a box that is inactive so that it can be deployed
    --[[repeat
        box = M.all_boxes[ random_value ]
     until( box.state == "OFF" )]]
    local box = M.all_boxes[ random_value ]
    local object = box.object
    object.x = 110
    object.y = 160
    box.state = "ON"

    return box
end

tmp = display.newRect(110, 160, 20, 20);
function M.moveBox( direction, box, box_x, box_y )
    
    if string.match(direction, "down") then
        box_y = box_y + 1
    end

    if string.match(direction, "up") then
        box_y = box_y - 1
    end

    if string.match(direction, "right") then
        box_x = box_x + 1
    end

    if string.match(direction, "left") then
        box_x = box_x - 1
    end
end

-- Checking the direction of the box movement
function M.checkMoveDirection (  )

    --local box = tmp
    -- Temporary declarations

    -- Next junction point coordinates
    --local junction_x = destination_object.x
    --local junction_y = destination_object.y

    -- Box's coordinates 
    local box_x = tmp.x
    print(box_x);
    local box_y = tmp.y
    print(box_y)

     return M.moveBox( "down", tmp, box_x, box_y )
    -- Checking which direction to move the box vertically.
    --[[if box_x == junction_x then 
        if junction_y > box_y then
            M.moveBox( "down", box, box_x, box_y )
            print("moving");
        else 
            M.moveBox( "up", box, box_x, box_y )
        end
    end
    -- Checking which direction to move the box horzontally.
    if box_y == junctionY then 
        if junction_x > box_x then
            M.moveBox( "right", box, box_x, box_y )
        else 
            M.moveBox( "left", box, box_x, box_y )
        end
    end

    -- Checking if the box has reached the junction point
    if box_x == junction_x and box_y == junction_y then
        box_destination = box_destination.next
    end

    -- Check if the box has reached an end point
    if box_destination.type == "end" then
        box_x = 110
        box_y = 160
        box.state = "OFF"
    end]]
end

return M