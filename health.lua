heal = {}
 
function heal.load()
	timer_med_kit = 1
	med_kit = {}
	med_kit.x = {}
	med_kit.y = {}
	med_kit.draw = {}
	med_kit.width = 32
	med_kit.height = 40
	med_kit.numbers = 1
	health_bar = {}
	player.firstHealth = 1
	healimg = love.graphics.newImage("images/heart.png")
	med_kit_img = love.graphics.newImage("images/med_kit.png")
	healanim = love.graphics.newQuad(0, 0, 70, 56, healimg:getDimensions())
	med_kit_anim = love.graphics.newQuad(0, 0, 32, 40, med_kit_img:getDimensions())
	local i = 1
	for k, object in pairs(map.objects) do
		if object.name == "med kit" then
			med_kit.x[i] = object.x
			med_kit.y[i] = object.y
			med_kit.numbers = i
			med_kit.draw[i] = true;
			i = i + 1
		end
	end	
end
function heal.update(dt)
	if player.x > 600 then
		health_bar.x = player.x - 350;
	else health_bar.x = 250;
	end
	
	health_bar.y = player.y - 190;
	timer_med_kit = timer_med_kit + dt;
	for k = 1, med_kit.numbers  do
		if  player.x + player_widht >= med_kit.x[k] and player.x  <= med_kit.x[k] + med_kit.width and
		player.y + player_height >= med_kit.y[k] and player.y <= med_kit.y[k] + med_kit.height then
			if timer_med_kit >= 0.1 then
				if med_kit.draw[k] == true then
					player.firstHealth = player.firstHealth - 1;
					med_kit.draw[k] = false
				end
			end 
		timer_med_kit = 0
		end
	end
	if player.firstHealth == 5 then
		player.death = true
	end
end
function heal.draw()
	for i = player.firstHealth, player.health do
		love.graphics.draw(healimg, healanim, health_bar.x-50*i + 50, health_bar.y)
	end
	for i = 1 , med_kit.numbers do
		if med_kit.draw[i] == true then
			love.graphics.draw(med_kit_img, med_kit_anim, med_kit.x[i], med_kit.y[i])
		end
	end
	if player.death == true then
		love.graphics.print("GAME OVER",player.x,player.y - 100)
	end
end