-- Random value generator 
local map = require('map')
local M = {}

M.green = {
    type = "image",
    filename = "green_bitmap.png"
}
M.blue = {
    type = "image",
    filename = "blue_bitmap.png"
}
M.yellow = {
    type = "image",
    filename = "yellow_bitmap.png"
}
M.red = {
    type = "image",
    filename = "red_bitmap.png"
}
M.pink = {
    type = "image",
    filename = "pink_bitmap.png"
}
M.orange = {
    type = "image",
    filename = "orange_bitmap.png"
}
M.purple = {
    type = "image",
    filename = "purple_bitmap.png"
}
M.brown = {
    type = "image",
    filename = "brown_bitmap.png"
}
M.spawn= {
    type = "image",
    filename = "spawn_bitmap.png"
}


function M.properRandomValue( prev_random )
    local random = math.random( 16 )
    if prev_random == random then
        random = math.random( 16 )
    end
    return random
end

function M.checkIfHighscore( score )
    local path = system.pathForFile( "score.txt", system.DocumentsDirectory )
    local highScore 
    -- Open the file handle
    local file, errorString = io.open( path, "r" )
 
    if not file then
        -- Error occurred; output the cause
        file = io.open(path, "w")
        file:write( score )
        io.close( file )
        file = nil
        highScore = score
        return { true, score, highScore}
    else
        -- Read data from file
        highScore = file:read( "*n" )
        print(highScore)
        io.close(file)
        file = nil

        -- Output the file contents
        if score > highScore then
            file = io.open( path, "w" )
            file:write(score)
            io.close( file )
            file = nil
            return {true, score, highScore}
        else
            return { false, score , highScore }
        end
    end
end

function M.decipherDestination( decipher )

    local type = decipher[1]
    local index = decipher[2]

    -- Finding which type of point/junction
    if type == "o" then
        return map.all_one_way_junctions[index]
    end

    if type == "t" then
        return map.all_two_way_junctions[index]
    end

    if type == "e" then
        return map.all_endpoints[index]
    end
end

function M.indexOf( table, value )

    -- Returns the index of the value in a table
    for index, v in pairs(table) do
        if v == value then
            return index
        end
    end
    return nil
end

-- Junction pointer direction logic
function M.changeJunctionDirection( touchedObject )

    --[[
    if touchedObject.rotationDir[touchedObject.direction] == "down" then
        touchedObject.rotation = 90
    end
    elseif touchedObject.rotationDir[touchedObject.direction] == "up" then
        touchedObject.rotation = -90
    elseif touchedObject.rotationDir[touchedObject.direction] == "left" then
        touchedObject.rotation = 90
    elseif touchedObject.rotationDir[touchedObject.direction] == "right" then
--]]
    local tmp = touchedObject.rotationDir
    if touchedObject.direction == 1 then
        if tmp == "rightDown" then
            touchedObject.rotation = 90
            touchedObject.direction = 2

        elseif tmp == "leftDown" then
            touchedObject.rotation = -90
            touchedObject.direction = 2

        elseif tmp == "leftUp" then
            touchedObject.rotation = 90
            touchedObject.direction = 2
        elseif tmp == "rightUp" then
            touchedObject.rotation = 0
            touchedObject.direction = 2
        end
    else
        if tmp == "rightDown" then
            touchedObject.rotation = 0
            touchedObject.direction = 1

        elseif tmp == "leftDown" then
            touchedObject.rotation = 0
            touchedObject.direction = 1
        
        elseif tmp == "leftUp" then
            touchedObject.rotation = 0
            touchedObject.direction = 1

        elseif tmp == "rightUp" then
            touchedObject.rotation = -90
            touchedObject.direction = 1
        end
    end
end

return M