local functions = require('functions')
local map = require('map')
local M = {}

-- Creation of inactive boxes
M.green_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.green_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.red_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.red_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.blue_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.blue_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.white_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.white_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.yellow_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.yellow_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.orange_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.orange_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.pink_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.pink_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.purple_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}
M.purple_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF"}

-- Table of all inactive boxes ready for deployment
M.all_boxes = {M.green_a, M.green_b, M.red_a, M.red_b, M.blue_a, M.blue_b, M.white_a, M.white_b, M.yellow_a, M.yellow_b, 
               M.orange_a, M.orange_b, M.pink_a, M.pink_b, M.purple_a, M.purple_b}

-- Variables assisting with random value generator
--M.prev_random = 0;
--M.random = 0

-- Spawning boxes on the map and calling move function
function M.spawnBoxes()
    local random_value = math.random( 16 )

    local box =  M.all_boxes[random_value]
    local object = box.object
    object.x = 110
    object.y = 160
    box.state = "ON"
end

-- Checking the direction of the box movement
function M.checkMoveDirection( box )

    local dest = functions.decipherDestination(box.destination)
    local destination_object = dest.object
    local box_object = box.object
    
    -- Box's coordinates 
    local box_x = box_object.x
    local box_y = box_object.y

    -- Next junction point coordinates
    local junction_x = destination_object[1]
    local junction_y = destination_object[2]

    print(junction_x)
    print(box_x)
    print(junction_y)
    print(box_y)
    -- Checking if a point has been reached
    if box_y == junction_y and box_x == junction_x then
        print("pures")
        return "none"
    end

    -- Checking which direction to move the box horzontally.
    if box_y == junction_y then 
        if junction_x > box_x then
            print("pure")
            return "right"
        else 
            print("pur")
            return "left"
        end
    end
    -- Checking which direction to move the box vertically.
    if box_x == junction_x then 
        if junction_y > box_y then
            print("pu")
            return "down"
        else 
            print("p")
            return "up"
        end
    end
end

return M