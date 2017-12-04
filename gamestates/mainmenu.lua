mainmenu = {}


mainmenu.font = love.graphics.newFont("assets/Sniglet-ExtraBold.otf", 120)
mainmenu.version_font = love.graphics.newFont("assets/Sniglet-Regular.otf", 30)

mainmenu.title = "Blip"
mainmenu.title_width = mainmenu.font:getWidth(mainmenu.title)

mainmenu.second_title = "alpha"

mainmenu.screen_width = love.graphics.getWidth()
mainmenu.screen_height = love.graphics.getHeight()

mainmenu.title_x = mainmenu.screen_width/2-mainmenu.title_width/2
mainmenu.title_y = 100

mainmenu.second_title_x = mainmenu.screen_width/2+mainmenu.title_width/2+30
mainmenu.second_title_y = 160


love.graphics.setBackgroundColor(45, 45, 48)


function mainmenu.update(dt)

end


function mainmenu.draw()
  love.graphics.setColor(190, 190, 199)
  love.graphics.setFont(mainmenu.font)
  love.graphics.print(mainmenu.title, mainmenu.title_x, mainmenu.title_y)

  love.graphics.setColor(123, 163, 198)
  love.graphics.setFont(mainmenu.version_font)
  love.graphics.print(mainmenu.second_title, mainmenu.second_title_x, mainmenu.second_title_y)

  love.graphics.setColor(255, 255, 255)
end
