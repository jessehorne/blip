local gamestate = require("lib.gamestate")

-- load gamestates
-- require("gamestates.test")
require("gamestates.mainmenu")


function love.load()
  -- gamestate.new("test", test)
  -- gamestate.switch("test")

  gamestate.new("mainmenu", mainmenu)
  gamestate.switch("mainmenu")
end


function love.update(dt)
  gamestate.update(dt)
end


function love.draw()
  gamestate.draw()
end
