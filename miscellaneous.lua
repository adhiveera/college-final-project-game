-- Random value generator 
local map = require('map')
local MODULE = {}

function MODULE.properRandomValue( prev_random )
    local random = math.random( 16 )
    if prev_random == random then
        random = math.random( 16 )
    end
    return random
end

function MODULE.checkIfHighscore( score )
    local path = system.pathForFile( "score.txt", system.DocumentsDirectory )
 
    -- Open the file handle
    local file, errorString = io.open( path, "r" )
 
    if not file then
        -- Error occurred; output the cause
        file = io.open( path, "w" )
        file:write( score )
        io.close( file )
        file = nil
    
        return {isHighScore = false, newScore = score}
    else
        print(score)
        -- Read data from file
        local contents = file:read( "*n" )
        -- Output the file contents
        if score > contents then
            --file = io.open( path, 'w')
            file:write(score)
        end
        io.close( file )
        file = nil
    
        return { isHighScore = true, newScore = score }
    end
end

function MODULE.decipherDestination( decipher )

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

function MODULE.indexOf( table, value )

    -- Returns the index of the value in a table
    for index, v in pairs(table) do
        if v == value then
            return index
        end
    end
    return nil
end

-- Junction pointer direction logic
function MODULE.changeJunctionDirection( touchedObject )
    
    if touchedObject.direction == 1 then
        touchedObject.direction = 2
    else
        touchedObject.direction = 1
    end
        
end

return MODULE