enemy_logic = {}
local direction = {}
local timer = {}
local timer_health = 0
 
function enemy_logic.load()
	rad = true;
	alien = love.graphics.newImage("images/alien.png")
	alienInv = love.graphics.newImage("images/alienInv.png")
	alien_went_animation = {}
	alienInv_went_animation = {}
	enemy = {}
	enemy.x = {}
	enemy.y = {}
	enemy.health = {}
	enemy_height = 66;
	enemy_width = 80;
	enemy.height = 66
	enemy.width = 80
	enemy.draw = {}
	
	enemy_wall = {}
	enemy_wall.R = {}
	enemy_wall.L = {}
	enemy_wall.R.x = {}
	enemy_wall.R.y = {}
	enemy_wall.L.x = {}
	enemy_wall.L.y = {}
	enemy_wall.width = 10;
	enemy_wall.height = 80;
	enemy_speed = 160
	enemy_health = 4;
	enemy_wall_numbers_R = 0;
	enemy_wall_numbers_L = 0;
	enemys_numbers = 0;
	local i = 1;
	local j = 1;

	for k, object in pairs(map.objects) do
		if object.name == "enemy" then
			enemy.x[i] = object.x
			enemy.y[i] = object.y
			enemy.health[i] = enemy_health;
			if rad == true then
				direction[i] = "right"
				rad = false;
			end
			if rad == false then
				direction[i] = "left"
				rad = true;
			end
			enemy.draw[i] = true
			enemys_numbers = i
			timer[i] = 0
			i = i + 1
		end
	end	
	for q, object in pairs(map.objects) do
		if object.name == "enemy_wall_R" then
			enemy_wall.R.x[j] = object.x
			enemy_wall.R.y[j] = object.y
			enemy_wall_numbers_R = j 
			j = j + 1
		end
	end
	j = 1
	for q, object in pairs(map.objects) do
		if object.name == "enemy_wall_L" then
			enemy_wall.L.x[j] = object.x
			enemy_wall.L.y[j] = object.y
			enemy_wall_numbers_L = j 
			j = j + 1
		end
	end
end
function enemy_logic.update(dt)

	for i = 1 , enemys_numbers do
		for k = 1, enemy_wall_numbers_R do
			if enemy.x[i] + enemy.width >= enemy_wall.R.x[k] and enemy.x[i] <= enemy_wall.R.x[k] + enemy_wall.width and
				enemy.y[i] >= enemy_wall.R.y[k] and enemy.y[i] + enemy_height <= enemy_wall.R.y[k] + enemy_wall.height + 20 then
					direction[i] = "left"
				end
			end
		for l = 1 , enemy_wall_numbers_L do
			if enemy.x[i] + enemy.width >= enemy_wall.L.x[l] and enemy.x[i] <= enemy_wall.L.x[l] + enemy_wall.width and
				enemy.y[i] >= enemy_wall.L.y[l] and enemy.y[i] <= enemy_wall.L.y[l] + enemy_wall.height then
					direction[i] = "right"
			end
		end	
		if enemy.health[i] == 0 then
			enemy.draw[i] = false;
		end
	end
	for i = 1 , enemys_numbers do
		if direction[i] == "right" then
			enemy.x[i] = enemy.x[i] + enemy_speed*dt;
		elseif direction[i] == "left" then
			enemy.x[i] = enemy.x[i] - enemy_speed*dt;
		end
	end
	alien_went_animation[1] = love.graphics.newQuad(0,   0, 70, 64, alien:getDimensions())
	alien_went_animation[2] = love.graphics.newQuad(73,  0, 69, 64, alien:getDimensions())
	alien_went_animation[3] = love.graphics.newQuad(142, 0, 69, 64, alien:getDimensions())
	alien_went_animation[4] = love.graphics.newQuad(213, 0, 78, 64, alien:getDimensions())

	alienInv_went_animation[1] = love.graphics.newQuad(0, 0, 83, 66, alienInv:getDimensions())
	alienInv_went_animation[2] = love.graphics.newQuad(89, 0, 69, 66, alienInv:getDimensions())
	alienInv_went_animation[3] = love.graphics.newQuad(159, 0, 69, 66, alienInv:getDimensions())
	alienInv_went_animation[4] = love.graphics.newQuad(230, 0, 69, 66, alienInv:getDimensions())

	timer_health = timer_health + dt;
	for k=1, enemys_numbers  do
		if  player.x + player_widht >= enemy.x[k] and player.x  <= enemy.x[k] + enemy_width and
		player.y + player_height >= enemy.y[k] and player.y <= enemy.y[k] + enemy_height and enemy.draw[k] == true then
			if timer_health >= 1 then
				player.firstHealth = player.firstHealth + 1;
				timer_health = 0
			end 
		
		end
	end
end
function enemy_logic.draw()
	for i = 1 , enemys_numbers do
		if enemy.draw[i] == true then
			if direction[i] == "right" then
				love.graphics.draw(alien, alien_went_animation[enemy_animation], enemy.x[i], enemy.y[i])
			else
				love.graphics.draw(alienInv, alienInv_went_animation[enemy_animation], enemy.x[i], enemy.y[i])
			end
		end
	end
end