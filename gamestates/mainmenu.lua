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

mainmenu.enemies = {}
mainmenu.enemy_text = "Destroy"
mainmenu.enemy_text_margin_x = mainmenu.button_font:getWidth(mainmenu.enemy_text) + 50
mainmenu.enemy_margin_x = 70
mainmenu.enemy_margin_y = 360
mainmenu.enemy_padding_x = 40


mainmenu.turrets = {}
mainmenu.turret_text = "Build"


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


function mainmenu.createEnemy(color)
  local e = {}

  e.color = color
  e.size = 10 + (#mainmenu.enemies*2)
  e.x = #mainmenu.enemies*(e.size+mainmenu.enemy_padding_x)
  e.y = mainmenu.enemy_margin_y

  table.insert(mainmenu.enemies, e)
end


function mainmenu.createTurret(color)
  local t = {}

  t.color = color
  t.size = 10 + (#mainmenu.turrets*4)
  t.x = #mainmenu.turrets*((t.size+mainmenu.enemy_padding_x)-#mainmenu.turrets*2)
  t.y = (mainmenu.enemy_margin_y + 80)-#mainmenu.turrets*2

  table.insert(mainmenu.turrets, t)
end


function mainmenu.load()
  mainmenu.addButton("Start", (function() gamestate.switch("game") end))
  mainmenu.addButton("Quit", (function() love.event.quit() end))

  mainmenu.createEnemy({211, 211, 226})
  mainmenu.createEnemy({201, 209, 87})
  mainmenu.createEnemy({93, 198, 95})
  mainmenu.createEnemy({168, 155, 155})
  mainmenu.createEnemy({134, 39, 188})

  mainmenu.createTurret({154, 154, 165})
  mainmenu.createTurret({209, 166, 87})
  mainmenu.createTurret({25, 229, 28})
  mainmenu.createTurret({247, 101, 101})
  mainmenu.createTurret({39, 47, 188})

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

  -- draw enemies
  love.graphics.setColor(190, 190, 199)
  love.graphics.setFont(mainmenu.button_font)
  love.graphics.print(mainmenu.enemy_text, 50, mainmenu.enemy_margin_y - 30)

  for i,v in ipairs(mainmenu.enemies) do
    love.graphics.setColor(unpack(v.color))
    love.graphics.circle("fill", mainmenu.enemy_text_margin_x + mainmenu.enemy_margin_x + v.x, v.y, v.size)
  end

  -- draw turrets
  love.graphics.setColor(190, 190, 199)
  love.graphics.setFont(mainmenu.button_font)
  love.graphics.print(mainmenu.turret_text, 50, mainmenu.enemy_margin_y + 60)

  for i,v in ipairs(mainmenu.turrets) do
    love.graphics.setColor(unpack(v.color))
    love.graphics.rectangle("fill", (mainmenu.enemy_text_margin_x + mainmenu.enemy_margin_x + v.x)-v.size/2, v.y, v.size, v.size)
  end

  -- draw mouse cursor
  love.graphics.setColor(190, 190, 199, 100)
  love.graphics.circle("fill", love.mouse.getX(), love.mouse.getY(), 10)

  love.graphics.setColor(255, 255, 255)
end
