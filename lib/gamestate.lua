local gamestate = {}


gamestate.gamestates = {}


function gamestate.new(name, state)
  gamestate.gamestates[name] = state
end

function gamestate.switch(name)
  gamestate.current = name
  if gamestate.gamestates[gamestate.current]["load"] then
    gamestate.gamestates[gamestate.current].load()
  end
end

-- Callbacks
function gamestate.update(dt)
  if gamestate.current then
    if gamestate.gamestates[gamestate.current]["update"] then
      gamestate.gamestates[gamestate.current].update(dt)
    end
  end
end


function gamestate.draw()
  if gamestate.current then
    if gamestate.gamestates[gamestate.current]["draw"] then
      gamestate.gamestates[gamestate.current].draw()
    end
  end
end


function gamestate.keypressed(key)
  if gamestate.current then
    if gamestate.gamestates[gamestate.current]["keypressed"] then
      gamestate.gamestates[gamestate.current].keypressed(key)
    end
  end
end


function gamestate.keyreleased(key)
  if gamestate.current then
    if gamestate.gamestates[gamestate.current]["keyreleased"] then
      gamestate.gamestates[gamestate.current].keyreleased(key)
    end
  end
end


return gamestate
