weapons = {};
local bullets = {}
bullets.x = {}
bullets.y = {}
bullets.inv = {}
bullets.draw = {}
bullets.timer = {}
player_shoot = {};
local wepon_update = false;
local atak_time = 1;
local atak_interval = 0.3;
local can_shoot = true
local previous_bulet = {};
local next_bulet = {};
local b_speed = 300;
local b_interval = 0.5;
local shooted_time = 0.0;
previous_bulet = 1
next_bulet = 0
local nb = next_bulet;
function weapons.load()
	source = love.audio.newSource( "1.mp3" )
end
function weapons.update(dt)
	atak_time = atak_time + dt;
	if love.keyboard.isDown("space") and atak_time >= 0.4 then
		atak_time = 0;
		player_shoot = true;
		love.audio.play(source)
		else player_shoot = false;
	end
	if atak_time >= 0.3 then
		love.audio.stop( source )
	end
	if player_shoot == true  then
		nb = nb + 1;
		bullets.draw[nb] = true;
		bullets.timer[nb] = 1;
		if inversion == false then
		bullets.x[nb] = player.x + player_widht;
		bullets.y[nb] = player.y + 11;
		bullets.inv[nb] = false;
		else
		bullets.x[nb] = player.x;
		bullets.y[nb] = player.y + 11;
		bullets.inv[nb] = true;
		end
	end
	
	
	for i = 1, nb do
		if bullets.inv[i] == false then
			bullets.x[i] = bullets.x[i] + b_speed*dt;
		else 
			bullets.x[i] = bullets.x[i] - b_speed*dt;
		end
	end
	for i = 1 , enemys_numbers do
		for k = 1, nb do
			bullets.timer[k] = bullets.timer[k] + dt/5;
			if enemy.x[i] + enemy.width >= bullets.x[k] and enemy.x[i] <= bullets.x[k] and enemy.draw[i] == true and
			enemy.y[i] <= bullets.y[k]  and enemy.y[i] + enemy_height >= bullets.y[k] 
			then
					if bullets.draw[k] == true then
					enemy.health[i] = enemy.health[i] - 1;
					bullets.draw[k] = false
				end
				
			end
			if bullets.timer[k] > 10 then
					bullets.draw[k] = false
				end
		end 
	end
end
function weapons.draw()
	for i = 1, nb do
		if bullets.draw[i] == true then
			love.graphics.circle('fill', bullets.x[i], bullets.y[i],2);
		end
    end
end