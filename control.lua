control = {};
local direcrions= {};
function control.load()
	go_speed = 200; --love.math.random(100,1000)
	basik_speed = go_speed;
	jump_speed = 300;
	jump_interval = 0;
	jump_time = 0.3;
	on_air = false;
	player.yPast = 800;
	inversion = false;
	c_is_down = false;
end
function control.update (dt)
	move = "idl"
	if direcrions == 'w' and c_is_down == false then
		player.y = player.y - jump_speed*dt;
		if love.keyboard.isDown'd' then
			player.x = player.x + go_speed*dt;
			move = "up";
			inversion = false;
		elseif love.keyboard.isDown'a' then
			player.x = player.x - go_speed*dt;
			move = "up";
			inversion = true;
		else move = "up";
		end
	elseif (on_graund == false or on_platform == false) and (love.keyboard.isDown'd' or love.keyboard.isDown'a') then
		player.y = player.y + fall_speed*dt;
		move = "went";
		if love.keyboard.isDown'd' then
			player.x = player.x + go_speed*dt;
			inversion = false;
		elseif love.keyboard.isDown'a' then 
			player.x = player.x - go_speed*dt;
			inversion = true;
		end
	elseif
	love.keyboard.isDown'c' and jump_interval >= jump_time then
		jump_interval = 0;
		if c_is_down == false then
			c_is_down = true
		else c_is_down = false
			player.y = player.y - 25;
		end
	else player.y = player.y + fall_speed*dt; move = "idl"
	end 
	if love.keyboard.isDown's' then
		s_is_down = true
	else s_is_down = false
	end
	if c_is_down == true then
		player_height = 42;
		move = "sit"
		if love.keyboard.isDown'd' then
			inversion = false;
			max_sit_animations = 3;
		elseif love.keyboard.isDown'a' then
			inversion = true;
			max_sit_animations = 3;
		else max_sit_animations = 1;
		end
	elseif c_is_down == false then
		player_height = standart_player_height;
	end
	jump_interval = jump_interval + dt;
	if jump_interval >= jump_time then
		direcrions = nil;
	end
	if on_graund == true or on_platform == true then
		player.yPast = player.y
	end
	if player.y == player.yPast then
		on_air = false
	else on_air = true
	end
	if player_shoot == true and c_is_down == false then
		move = "fire"
	elseif player_shoot == true and c_is_down == true then
		move = "sit_fire"
	end
	if player.x <= 0 and inversion == true then
		go_speed = 0
	else go_speed = basik_speed;
	end
end
function control.keypressed()
	if love.keyboard.isDown 'escape' then
		love.event.quit ();
	end
	if love.keyboard.isDown 'w' and (on_graund == true or on_platform == true) and on_air == false  then
		direcrions = 'w';
		c_is_down = false;
		jump_interval = 0;  
		on_graund = false
	end

end