phisiks = {}
local graund_nubers = 0
function phisiks.load()
	
	local i = 1
	for k, object in pairs(map.objects)  do
		if object.name == "platform" then
			platform.x[i] = object.x
			platform.y[i] = object.y
			platform.width[i] = object.width
			platform.height[i] = object.height
			i = i + 1
			number_platforms = number_platforms + 1
		end
	end
	i = 1;
	for k, object in pairs(map.objects)  do
		if object.name == "graund" then
			graund.x[i] = object.x
			graund.y[i] = object.y
			graund.width[i] = object.width
			graund.height[i] = object.height
			i = i + 1
			graund_nubers = graund_nubers + 1
		end
	end
	for k, object in pairs(map.objects) do
		if object.name == "player" then
			player.x = object.x
			player.y = object.y
		end
	end
end
function phisiks.update(dt)
	--if player.y + player_height >= 382 then
	--	fall_speed = 0
	--	on_graund = true
--	else
	--	fall_speed = 400
--	end
	local k,j
	j = number_platforms 
	if s_is_down == false then
		for k=1, j  do
			if  player.x + player_widht >= platform.x[k] and player.x  <= platform.x[k] + platform.width[k] and
			player.y + player_height >= platform.y[k] and player.y + player_height <= platform.y[k] + platform.height[k] then
				on_platform = true
				fall_speed = 0;
				player.y  = platform.y[k] - player_height
			elseif fall_speed ~= 0 then
				on_platform = false
				on_graund = false
			end 
		end 
	end
	j =  graund_nubers 
	for k = 1, j do
			if  player.x + player_widht >= graund.x[k] and player.x  <= graund.x[k] + graund.width[k] and
			player.y + player_height >= graund.y[k] and player.y + player_height <= graund.y[k] + graund.height[k] then
				on_graund = true
				fall_speed = 0;
				player.y  = graund.y[k] - player_height
			else fall_speed = 400
			end 
		end 
end
