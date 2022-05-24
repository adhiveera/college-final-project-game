-- Random value generator 
local MODULE = {}

function MODULE.properRandomValue( prev_random )
    local random = math.random( 16 )
    if prev_random == random then
        random = math.random( 16 )
    end
    return random
end

-- Move boxes on the map
function MODULE.moveBox( direction, box )

    -- Box's coordinates 
    local box_x = box.object.x
    local box_y = box.object.y

    if string.match(direction, "down") then
        box_y = box.y+1
    end

    if string.match(direction, "up") then
        box_y = box_y-1
    end

    if string.match(direction, "right") then
        box_x = box_x+1
    end

    if string.match(direction, "left") then
        box_x = box_x-1
    end
end

-- Junction pointer direction logic
function MODULE.changeJunctionDirection( touchedObject )
    local current_junction = all_two_way_junctions[i]

    for i = 1, 7 do
        if touchedObject == current_junction.object then 
            if current_junction.direction == 0 then
                current_junction = 1
            else
                current_junction = 0
            end
        end
    end
end

return MODULE