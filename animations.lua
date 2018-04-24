anim = {}
function anim.load()
	img = love.graphics.newImage("images/halo.png")
	imgInv = love.graphics.newImage("images/haloInv.png")
	imgSit = love.graphics.newImage("images/halo_sit.png")
	went_animation = {}
	sit_animation = {}
	jump_animation = {} 
	animation = 1
	max_animations = 10
	animation_sit = 1
	max_sit_animations = 1
	timer = 0.1
	standart_player_height = player_height;
	enemy_animation = 1
end
function anim.update(dt)
	timer = timer + dt
	if timer > 0.18 then
		timer = 0.1;
		animation = animation + 1;
		animation_sit = animation_sit + 1;
		enemy_animation = enemy_animation + 1;
	end
	if animation > max_animations then
		animation = 1
	end
	if animation_sit > max_sit_animations then
		animation_sit = 1
	end
	if enemy_animation > 4 then
		enemy_animation = 1;
	end
	if inversion == false then
		went_animation[1] = love.graphics.newQuad(115, 0, 42, 57, img:getDimensions())
		went_animation[2] = love.graphics.newQuad(164, 0, 37, 57, img:getDimensions())
		went_animation[3] = love.graphics.newQuad(210, 0, 40, 57, img:getDimensions())
		went_animation[4] = love.graphics.newQuad(255, 0, 48, 57, img:getDimensions())
		went_animation[5] = love.graphics.newQuad(308, 0, 47, 57, img:getDimensions())
		went_animation[6] = love.graphics.newQuad(363, 0, 41, 57, img:getDimensions())
		went_animation[7] = love.graphics.newQuad(410, 0, 40, 57, img:getDimensions())
		went_animation[8] = love.graphics.newQuad(453, 0, 42, 57, img:getDimensions())
		went_animation[9] = love.graphics.newQuad(496, 0, 48, 57, img:getDimensions())
		went_animation[10] = love.graphics.newQuad(554, 0, 48,57, img:getDimensions())

		idl_animation = love.graphics.newQuad(0, 0, 42, 57, img:getDimensions())

		fire_animation = love.graphics.newQuad(48, 0, 57, 57, img:getDimensions())

		sit_animation[1] = love.graphics.newQuad(146, 88, 40, 40, img:getDimensions())
		sit_animation[2] = love.graphics.newQuad(190, 88, 42, 40, img:getDimensions())
		sit_animation[3] = love.graphics.newQuad(232, 88, 42, 40, img:getDimensions())

		jump_animation[1] = love.graphics.newQuad(9, 73, 39, 58, img:getDimensions())
		jump_animation[2] = love.graphics.newQuad(48, 69, 43, 62, img:getDimensions())
		jump_animation[3] = love.graphics.newQuad(100, 76, 41, 55, img:getDimensions())

		sit_fire_animation = love.graphics.newQuad(0, 0, 52, 40, imgSit:getDimensions())
	else
		went_animation[1] = love.graphics.newQuad(441, 0, 42, 57, imgInv:getDimensions())
		went_animation[2] = love.graphics.newQuad(399, 0, 37, 57, imgInv:getDimensions())
		went_animation[3] = love.graphics.newQuad(350, 0, 40, 57, imgInv:getDimensions())
		went_animation[4] = love.graphics.newQuad(297, 0, 48, 57, imgInv:getDimensions())
		went_animation[5] = love.graphics.newQuad(244, 0, 47, 57, imgInv:getDimensions())
		went_animation[6] = love.graphics.newQuad(195, 0, 41, 57, imgInv:getDimensions())
		went_animation[7] = love.graphics.newQuad(150, 0, 40, 57, imgInv:getDimensions())
		went_animation[8] = love.graphics.newQuad(103, 0, 42, 57, imgInv:getDimensions())
		went_animation[9] = love.graphics.newQuad(55, 0, 48, 57, imgInv:getDimensions())
		went_animation[10] = love.graphics.newQuad(0,0, 42, 57, imgInv:getDimensions())

		idl_animation = love.graphics.newQuad(555, 0, 42, 57, imgInv:getDimensions())

		fire_animation = love.graphics.newQuad(493, 0, 57, 57, imgInv:getDimensions())

		sit_animation[1] = love.graphics.newQuad(412, 87, 40, 41, imgInv:getDimensions())
		sit_animation[2] = love.graphics.newQuad(369, 87, 40, 41, imgInv:getDimensions())
		sit_animation[3] = love.graphics.newQuad(329, 87, 40, 41, imgInv:getDimensions())

		jump_animation[1] = love.graphics.newQuad(551, 73, 36, 61, imgInv:getDimensions())
		jump_animation[2] = love.graphics.newQuad(508, 69, 36, 61, imgInv:getDimensions())
		jump_animation[3] = love.graphics.newQuad(458, 76, 36, 61, imgInv:getDimensions())

		sit_fire_animation = love.graphics.newQuad(53, 0, 52, 40, imgSit:getDimensions())
	end
end
function anim.draw()

	if inversion == false then
		if move == "idl" then
			love.graphics.draw(img, idl_animation, player.x, player.y)
		elseif move == "went" then
			love.graphics.draw(img, went_animation[animation], player.x, player.y)
		elseif  move == "up" then
			love.graphics.draw(img, jump_animation[1], player.x, player.y)
		elseif  move == "fire" then
			love.graphics.draw(img, fire_animation, player.x, player.y)
		elseif move == "sit" then
			love.graphics.draw(img, sit_animation[animation_sit], player.x, player.y)
		elseif move == "sit_fire" then
			love.graphics.draw(imgSit, sit_fire_animation, player.x, player.y)
		end
	else
		if move == "idl" then
			love.graphics.draw(imgInv, idl_animation, player.x, player.y)
		elseif move == "went" then
			love.graphics.draw(imgInv, went_animation[animation], player.x, player.y)
		elseif  move == "up" then
			love.graphics.draw(imgInv, jump_animation[1], player.x, player.y)
		elseif  move == "fire" then
			love.graphics.draw(imgInv, fire_animation, player.x-14, player.y)
		elseif move == "sit" then
			love.graphics.draw(imgInv, sit_animation[animation_sit], player.x, player.y)
		elseif move == "sit_fire" then
			love.graphics.draw(imgSit, sit_fire_animation, player.x-12, player.y+1)
		end
	end
end