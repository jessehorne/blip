game = {}


game.font = love.graphics.newFont("assets/Sniglet-Regular.otf", 25)

game.topbar = {}
game.topbar.x = 0
game.topbar.y = 0
game.topbar.width = love.graphics.getWidth()
game.topbar.height = 100
game.topbar.bg_color = {150, 150, 150, 50}

game.field = {}
game.field.x = 0
game.field.y = game.topbar.height
game.field.width = love.graphics.getWidth()
game.field.height = love.graphics.getHeight() - game.topbar.height

game.stage = {}
game.stage.screaming = false
game.stage.screaming_timer = 0
game.stage.which = 0

game.pause = {}
game.pause.text = "Paused"
game.pause.paused = false


game.buttons = {}

game.buttons[1] = {}
game.buttons[1].x = 10
game.buttons[1].y = 10
game.buttons[1].text = "Back"
game.buttons[1].width = game.font:getWidth(game.buttons[1].text)
game.buttons[1].height = game.font:getHeight(game.buttons[1].text)
game.buttons[1].hover = false


function game.scream(which)
  game.stage.screaming = true
  game.stage.screaming_timer = 3
  game.stage.which = which
end


function game.load()
  love.graphics.setBackgroundColor(45, 45, 48)

  game.scream(1)
end


function game.draw()
  -- TOPBAR

  -- topbar background
  love.graphics.setColor(unpack(game.topbar.bg_color))
  love.graphics.rectangle("fill",
                          game.topbar.x,
                          game.topbar.y,
                          game.topbar.width,
                          game.topbar.height)


  -- draw screaming stage thing
  if game.stage.screaming then
    love.graphics.setColor(100, 100, 100)

    local which = game.stage.which
    local scream_text = "Stage " .. which
    local x = game.field.width/2 - game.font:getWidth(scream_text)
    local y = game.field.y + 200

    love.graphics.print(scream_text, x, y)
  end

  -- draw topbar buttons
  for i,v in ipairs(game.buttons) do
    if v.hover then
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(200, 200, 200)
    end

    love.graphics.setFont(game.font)
    love.graphics.print(v.text, v.x, v.y) -- print topbar buttons
  end

  love.graphics.setColor(255, 255, 255)
end


function game.update(dt)
  -- is game paused?
  if not game.pause.paused then

    -- handle stage screaming timer
    if game.stage.screaming then
      game.stage.screaming_timer = game.stage.screaming_timer - dt

      if game.stage.screaming_timer <= 0 then
        game.stage.screaming = false
        game.stage.screaming_timer = 0
      end
    end
  end

  -- collision/clicking for buttons
  for i,v in ipairs(game.buttons) do
    local m_x = love.mouse.getX()
    local m_y = love.mouse.getY()

    local b_w = v.width
    local b_h = v.height

    if math.bbox(m_x, m_y, 1, 1, v.x, v.y, b_w, b_h) then
      v.hover = true
    else
      v.hover = false
    end
  end
end
