local miscellaneous = require('miscellaneous')
local map = require('map')
local M = {}

-- Creation of inactive boxes
M.green_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "green"}
M.green_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "green"}
M.red_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "red"}
M.red_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "red"}
M.blue_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "blue"}
M.blue_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "blue"}
M.white_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "white"}
M.white_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "white"}
M.yellow_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "yellow"}
M.yellow_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "yellow"}
M.orange_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "orange"}
M.orange_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "orange"}
M.pink_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "pink"}
M.pink_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "pink"}
M.purple_a = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "purple"}
M.purple_b = {object = display.newRect(-110, -160, 20, 20), destination = {"o", 1}, state = "OFF", colour = "purple"}

M.tmp = display.newRect(-110, -160, 20, 20)
M.tmp.pure = 5
M.all_boxes = {M.green_a, M.green_b, M.red_a, M.red_b, M.blue_a, M.blue_b, M.white_a, M.white_b, M.yellow_a, M.yellow_b, 
               M.orange_a, M.orange_b, M.pink_a, M.pink_b, M.purple_a, M.purple_b}
M.all_boxes_off = M.all_boxes

-- Spawning boxes on the map and calling move function
function M.spawnBoxes()
    local all_boxes_off = {}
    for key, value in pairs(M.all_boxes) do
        if value.state == "OFF" then
            table.insert(all_boxes_off, value)
        end
    end

    local random_value = math.random( #all_boxes_off )

    local box =  all_boxes_off[random_value]
    local object = box.object
    object.x = 110
    object.y = 160

    if box.state == "OFF" then
        box.state = "ON"
    end
end

-- Checking the direction of the box movement
function M.checkMoveDirection( box )

    local dest = miscellaneous.decipherDestination(box.destination)
    local destination_coordinates = dest.coordinates
    local box_object = box.object
    
    -- Box's coordinates 
    local box_x = box_object.x
    local box_y = box_object.y

    -- Next junction point coordinates
    local junction_x = destination_coordinates[1]
    local junction_y = destination_coordinates[2]

    -- Checking if a point has been reached
    if box_y == junction_y and box_x == junction_x then
        return "none"
    end

    -- Checking which direction to move the box horzontally.
    if box_y == junction_y then 
        if junction_x > box_x then
            return "right"
        else 
            return "left"
        end
    end
    -- Checking which direction to move the box vertically.
    if box_x == junction_x then 
        if junction_y > box_y then
            return "down"
        else 
            return "up"
        end
    end
end

return M