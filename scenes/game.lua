local composer = require('composer')
local relayout = require('relayout')
local miscellaneous, boxes, map

-- Layout
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY

-- Scene
local scene = composer.newScene()

-- Groups
local grpMain

-- Variables
local gameState
local score
local spawnPt
local displayScore
local lives = 5
local startTime
local counter
local orange, green
local pink, yellow
local red, brown
local blue, purple

-- Functions

function moveBox( direction, box )
    
    if direction == "down" then
        box.y = box.y + 0.5
    end

    if direction == "up" then
        box.y = box.y - 0.5
    end

    if direction == "right" then
        box.x = box.x + 0.5
    end

    if direction == "left" then
        box.x = box.x - 0.5
    end

    if direction == "none" then
        --do nothing 
    end
end

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
            lives = lives - 1
        end
    end
end

function inserter( grpMain )
    
    grpMain:insert(displayScore)
    
    -- Remove all junction points from screen
    for key, value in pairs(map.all_two_way_junctions) do

        local object = map.all_two_way_junctions[key].object
        grpMain:insert(object)
    end
    
    green = display.newRect(137, 363,28,28)
    green.fill = miscellaneous.green
    grpMain:insert(green)
    blue = display.newRect(292, 607,28,28)
    blue.fill = miscellaneous.blue
    grpMain:insert(blue)
    yellow = display.newRect(228, 306,28,28)
    yellow.fill = miscellaneous.yellow
    grpMain:insert(yellow)
    red = display.newRect(59,536,28,28)
    red.fill = miscellaneous.red
    grpMain:insert(red)
    brown = display.newRect(125,607,28,28)
    brown.fill = miscellaneous.brown
    grpMain:insert(brown)
    orange = display.newRect(69,292,28,28)
    orange.fill = miscellaneous.orange
    grpMain:insert(orange)
    purple = display.newRect(228,536,28,28)
    purple.fill = miscellaneous.purple
    grpMain:insert(purple)
    pink = display.newRect(292,237,28,28)
    pink.fill = miscellaneous.pink
    grpMain:insert(pink)
    spawnPt = display.newRect(125,221,28,28)
    spawnPt.fill = miscellaneous.spawn
    grpMain:insert(spawnPt)

    spawnPt.alpha = 0; green.alpha = 0; blue.alpha =0; yellow.alpha = 0; red.alpha =0; brown.alpha=0; orange.alpha=0; purple.alpha=0; pink.alpha=0;
    -- Insert all boxes from screen
    for key, value in pairs(boxes.all_boxes) do

        local object = boxes.all_boxes[key].object
        grpMain:insert(object)
    end
end

function cleanUp() 
    print("");
    Runtime:removeEventListener("enterFrame", update)
    map.junction_tw_2.object:removeEventListener("touch", touchListener)
    map.junction_tw_1.object:removeEventListener("touch", touchListener)
    map.junction_tw_3.object:removeEventListener("touch", touchListener)
    map.junction_tw_4.object:removeEventListener("touch", touchListener)
    map.junction_tw_5.object:removeEventListener("touch", touchListener)
    map.junction_tw_6.object:removeEventListener("touch", touchListener)
    map.junction_tw_7.object:removeEventListener("touch", touchListener)
    green:removeSelf()
    green = nil
    yellow:removeSelf()
    yellow = nil
    orange:removeSelf()
    orange = nil
    pink:removeSelf()
    pink = nil
    blue:removeSelf()
    blue = nil
    purple:removeSelf()
    purple = nil
    red:removeSelf()
    red = nil
    brown:removeSelf()
    brown = nil

    displayScore:removeSelf()
    displayScore = nil
    -- Remove all boxes from screen
    for key, value in pairs(boxes.all_boxes) do

        local object = boxes.all_boxes[key].object
        object:removeSelf()
        object = nil
    end

    -- Remove all junction points from screen
    for key, value in pairs(map.all_two_way_junctions) do

        local object = map.all_two_way_junctions[key].object
        object:removeSelf()
        object = nil
    end
end

function update()    

    if gameState == "playing" then
        local all_boxes_on = {}
        for key, value in pairs(boxes.all_boxes) do
            if value.state == "ON" then
                table.insert(all_boxes_on, value)
            end
        end

        -- Displaying the updated score each frame.
        displayScore.text = tostring(lives)

        local length = #all_boxes_on
        for i = 1, length do
            local box = all_boxes_on[i]
            local state = box.state
            
            if state == "ON" then
                local direction = boxes.checkMoveDirection(box)
                if direction == "none" then
                    setNextDestination(box, miscellaneous.decipherDestination(box.destination))
                end
                moveBox(direction, box.object )
            end    
        end
        if lives == 0 then 
            gameState = "over"
        end

        if gameState == "over" then
            local name = composer.getSceneName("current")
            local gameResult = miscellaneous.checkIfHighscore( score )
            miscellaneous.finalScore = gameResult
            --composer.removeScene(name) 
            composer.gotoScene("scenes.gameover")
        end
    end
end

-- Touch 
function touchListener( event )
    counter = counter +1
    if event.phase == "ended" then 
        miscellaneous.changeJunctionDirection( event.target, counter )
        print( "Object tapped: " .. tostring(event.target) )
    end
end

function listener( event )
    if gameState == "playing" then
        boxes.spawnBoxes()
        lastTime = system.getTimer() 
        timer.cancelAll()
        timer.performWithDelay( 3500, listener )
    end
end

function onMouseEvent( event )
    if event.type == "down" then
        if event.isPrimaryButtonDown then
            print( event.x .. "     ".. event.y )
        elseif event.isSecondaryButtonDown then
            print( "Right mouse button clicked." )        
        end
    end
end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )
    print("scene:create - game")

    miscellaneous = require('miscellaneous')
    map = require('map')
    boxes = require('boxes')

    displayScore = display.newText( "0", _CX, 80, "Nexa Bold.otf", 60)
    displayScore:setTextColor( 0,0,0)
    
    -- Create main group and insert to scene
    grpMain = display.newGroup()
    local bg = display.newImageRect("background1.png", _W, _H)
    bg.x = _CX
    bg.y = _CY
    grpMain:insert(bg)
    grpMain:insert(map.junction_tw_group)
    self.view:insert(grpMain)
    
    -- Initializing variables
    timer.performWithDelay( 1000, listener )
end

-- show()
function scene:show( event )
  if ( event.phase == "will" ) then
    
    inserter(grpMain)
    score = 0
    counter = 0
    lives = 5
    gameState = "playing"
  elseif ( event.phase == "did" ) then
    Runtime:addEventListener( "mouse", onMouseEvent )
    Runtime:addEventListener("enterFrame", update)
    map.junction_tw_2.object:addEventListener("touch", touchListener)
    map.junction_tw_1.object:addEventListener("touch", touchListener)
    map.junction_tw_3.object:addEventListener("touch", touchListener)
    map.junction_tw_4.object:addEventListener("touch", touchListener)
    map.junction_tw_5.object:addEventListener("touch", touchListener)
    map.junction_tw_6.object:addEventListener("touch", touchListener)
    map.junction_tw_7.object:addEventListener("touch", touchListener)
    spawnPt.alpha = 1; green.alpha = 1; blue.alpha =1; yellow.alpha = 1; red.alpha =1; brown.alpha=1; orange.alpha=1; purple.alpha=1; pink.alpha=1;
  end
end

-- hide())
function scene:hide( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
    Runtime:removeEventListener("enterFrame", update)
    Runtime:removeEventListener( "mouse", onMouseEvent )
    map.junction_tw_2.object:removeEventListener("touch", touchListener)
    map.junction_tw_1.object:removeEventListener("touch", touchListener)
    map.junction_tw_3.object:removeEventListener("touch", touchListener)
    map.junction_tw_4.object:removeEventListener("touch", touchListener)
    map.junction_tw_5.object:removeEventListener("touch", touchListener)
    map.junction_tw_6.object:removeEventListener("touch", touchListener)
    map.junction_tw_7.object:removeEventListener("touch", touchListener)
  end
end

-- destroy()
function scene:destroy(event)
    if event.phase == "will" then
        cleanUp()
        print("kakka")
        composer.gotoScene("scenes.gameover")
    end
end

-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene