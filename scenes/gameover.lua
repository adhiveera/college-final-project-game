local composer = require('composer')
local relayout = require('relayout')
local miscellaneous = require('miscellaneous')

-- Layout
local _W, _H, _CX, _CY = relayout._W, relayout._H, relayout._CX, relayout._CY

-- Scene
local scene = composer.newScene()

-- Groups
local grpMain


-- Variables
local score
local text
local btnPlayAgain
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
function next()
    composer.removeScene("scene.game")
    composer.removeScene("boxes")
    composer.removeScene("map")
    composer.removeScene("miscellaneous")
    composer.gotoScene("scenes.game", { effect = "slideLeft"})
end

function onMouseEvent( event )
  if event.type == "down" then
      if event.isPrimaryButtonDown then
          print( event.x .. "   " .. event.y )
      elseif event.isSecondaryButtonDown then
          print( "Right mouse button clicked." )        
      end
  end
end

function scene:create( event )
    print("scene:create - gameover")

    -- Create main group and insert to scene
    grpMain = display.newGroup()

    self.view:insert(grpMain)

    -- Insert objects to grpMain here
    local bg = display.newImageRect("background1.png", _W, _H)
    bg.x = _CX
    bg.y = _CY
    grpMain:insert(bg)
    local tmp = miscellaneous.finalScore
    score = tmp[2] 

    local lblScore = display.newText("Score: " .. tostring(score), _CX, _CY - 80, "PressStart2P-Regular.ttf", 20)
    local lblHighScore = display.newText("Highscore: " .. tostring(tmp[3]), _CX, _CY - 30  , "PressStart2P-Regular.ttf", 16)

    btnPlayAgain = display.newText("Play Again", _CX, _CY + 50, "PressStart2P-Regular.ttf", 25)
    grpMain:insert(lblScore)
    grpMain:insert(lblHighScore)
    grpMain:insert(btnPlayAgain)

end

-- show()
function scene:show( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
    
    btnPlayAgain:addEventListener("tap", next )
    Runtime:addEventListener("enterFrame", update)
  end
end

-- hide())
function scene:hide( event )
  if ( event.phase == "will" ) then
  elseif ( event.phase == "did" ) then
    btnPlayAgain:removeEventListener("tap", next)
    Runtime:removeEventListener("enterFrame", update)
  end
end

-- destroy()
function scene:destroy(event)
  if event.phase == "will" then
    print("adf")
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