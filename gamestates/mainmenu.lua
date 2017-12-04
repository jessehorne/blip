local math = require("lib.math")


mainmenu = {}


mainmenu.font = love.graphics.newFont("assets/Sniglet-ExtraBold.otf", 120)
mainmenu.version_font = love.graphics.newFont("assets/Sniglet-Regular.otf", 30)
mainmenu.button_font = love.graphics.newFont("assets/Sniglet-Regular.otf", 40)

mainmenu.title = "Blip"
mainmenu.title_width = mainmenu.font:getWidth(mainmenu.title)

mainmenu.second_title = "alpha"

mainmenu.screen_width = love.graphics.getWidth()
mainmenu.screen_height = love.graphics.getHeight()

mainmenu.title_x = mainmenu.screen_width/2-mainmenu.title_width/2
mainmenu.title_y = 60

mainmenu.second_title_x = mainmenu.screen_width/2+mainmenu.title_width/2+30
mainmenu.second_title_y = 120

mainmenu.buttons = {}


love.graphics.setBackgroundColor(45, 45, 48)


function mainmenu.addButton(text, func)
  local b = {}

  b.text = text
  b.width = mainmenu.button_font:getWidth(b.text)
  b.height = mainmenu.button_font:getHeight(b.text)
  b.x = mainmenu.second_title_x
  b.y = 350 + (#mainmenu.buttons*(b.height+10))
  b.hover = false
  b.func = func

  table.insert(mainmenu.buttons, b)
end


function mainmenu.load()
  mainmenu.addButton("Start", (function() gamestate.switch("game") end))
  mainmenu.addButton("Quit", (function() love.event.quit() end))

  love.mouse.setVisible(false)
end


function mainmenu.update(dt)
  local mouse_x = love.mouse.getX()
  local mouse_y = love.mouse.getY()

  for i,v in ipairs(mainmenu.buttons) do
    if math.bbox(mouse_x, mouse_y, 1, 1, v.x, v.y, v.width, v.height) then
      v.hover = true

      if love.mouse.isDown(1) then
        v.func()
      end
    else
      v.hover = false
    end
  end
end


function mainmenu.draw()
  love.graphics.setColor(190, 190, 199)
  love.graphics.setFont(mainmenu.font)
  love.graphics.print(mainmenu.title, mainmenu.title_x, mainmenu.title_y)

  love.graphics.setColor(123, 163, 198)
  love.graphics.setFont(mainmenu.version_font)
  love.graphics.print(mainmenu.second_title, mainmenu.second_title_x, mainmenu.second_title_y)

  -- draw buttons
  love.graphics.setFont(mainmenu.button_font)
  for i,v in ipairs(mainmenu.buttons) do
    if v.hover then
      love.graphics.setColor(123, 163, 198)
    else
      love.graphics.setColor(150, 150, 150)
    end

    love.graphics.print(v.text, v.x, v.y)
  end

  -- draw mouse cursor
  love.graphics.setColor(190, 190, 199, 100)
  love.graphics.circle("fill", love.mouse.getX(), love.mouse.getY(), 10)

  love.graphics.setColor(255, 255, 255)
end
