local sti = require "sti"
key_global = 0;
local t = 0;
function love.load()
	love.window.setFullscreen(true, "desktop")
	map = sti("start.lua")
	fons = love.graphics.newImage("start.png")
end 
function love.update(dt)
	if key_global == 1 then
		map = sti("level.lua")
		require("gameplay")
		if t == 0 then
			gameplay.load()
		end
		gameplay.update(dt)
		t = 1;
	end
	map:update(dt)
end
function love.keypressed()
	if key_global == 1 then
		gameplay.keypressed()
	end
	if love.keyboard.isDown'1' then
		key_global = 1;
	elseif love.keyboard.isDown'0' then
		key_global = 0;
	end
	if love.keyboard.isDown 'escape' then
		love.event.quit ();
	end
end
function love.mousereleased(mousex, mousey, button)
	if key_global == 0 then
		if button == 1 and mousex >= 500 and mousex <= 500+800 and mousey >=400 and mousey <= 400+110 then
			key_global = 1;
		end
	end   
end
function love.draw()
	if key_global == 1 then
		gameplay.draw()
	elseif key_global == 0 then
		map:draw()
		love.graphics.draw(fons)
	end
end