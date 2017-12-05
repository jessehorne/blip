gamestate = require("lib.gamestate")
math = require("lib.math")

-- load gamestates
-- require("gamestates.test")
require("gamestates.mainmenu")
require("gamestates.game")


function love.load()
  -- gamestate.new("test", test)
  -- gamestate.switch("test")

  gamestate.new("mainmenu", mainmenu)
  gamestate.new("game", game)
  gamestate.switch("mainmenu")
end


function love.update(dt)
  gamestate.update(dt)
end


function love.draw()
  gamestate.draw()

  -- draw mouse cursor
  love.graphics.setColor(190, 190, 199, 100)
  love.graphics.circle("fill", love.mouse.getX(), love.mouse.getY(), 10)

  love.graphics.setColor(255, 255, 255)
end
