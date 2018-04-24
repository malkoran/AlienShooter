gameplay = {}
function gameplay.load()
	graund = {}
	graund.x = {}
	graund.y = {}
	graund.width = {}
	graund.height = {}
	
	
	
	player = {};
	land = {}
	platform = {};
	platform.y = {}
	platform.x = {}
	player.death = false;
	platform.width = {}
	platform.height = {}
	move = {}
	fall_speed = 300
	player_height = 57;
	player_widht = 40;
	player.x = 80
	player.y = 100
	player.health = 4
	
	on_graund = false;
	on_platform = false
	wepon_update = false
	move = "idl"
	number_platforms = 0
	
	require "control"
	require "phisiks"
	require "animations"
	require "enemies"
	require "health"
	require "Player_Wepons"
	phisiks.load()
	control.load()
	anim.load()
	enemy_logic.load()
	heal.load()
	weapons.load()
	fon = love.graphics.newImage("images/fon.jpg")
end
function gameplay.update(dt)
	control.update(dt)
	phisiks.update(dt)
	enemy_logic.update(dt)
	weapons.update(dt)
	anim.update(dt)
	heal.update(dt)
end
function gameplay.keypressed()
	control.keypressed()
end
function gameplay.draw()
	love.graphics.draw(fon)
	map:draw()
	local scale = 1.2
	local screen_width = love.graphics.getWidth() / scale
	local screen_height = love.graphics.getHeight() /scale

	local tx = math.floor(player.x - screen_width / 2)
	local ty = math.floor(player.y - screen_height / 2)
	if player.x < 570 
	then
		tx = 0
	elseif player.x > 5830 then
		tx = 5830 - 570
	end 
	love.graphics.draw(fon, fx, fy, 0, scale, scale)
	map:draw(-tx, -ty, scale, scale)
	
	love.graphics.scale(scale)
	love.graphics.translate(-tx, -ty)
	anim.draw()
	enemy_logic.draw()
	heal.draw()
	weapons.draw()
end