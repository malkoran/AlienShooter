craft = {};
item1 = {};
item2 = {};
item3 = {};
drawitem1 = true;
drawitem2 = true;
drawitem3 = false;
mouse_comand_craft = false;
function craft.load()
	width = love.graphics.getWidth();
	height = love.graphics.getHeight();
	item1.x = 550;
	item1.y = height / 2 + 230;
	item2.x = width  / 2 - 200;
	item2.y = height / 2 + 140;
	item3.x = width  / 2 + 245;
	item3.y = height / 2 + 50;
end
function craft.update (dt)

	if player.x  <= item1.x + 10 and player.x + player_widht + 10 >= item1.x and player.y <= item1.y + 10  and player.y + player_height >= item1.y then
		drawitem1 = false; 
	end
	
	if player.x  <= item2.x + 10 and player.x + player_widht + 10 >= item2.x and player.y <= item2.y + 10  and player.y + player_height >= item2.y then
		drawitem2 = false;
	end
	
	if drawitem1 == false and drawitem2 == false then
		drawitem3 = true;
	end
	
	
end
function craft.mousereleased(mousex, mousey, button)
   if button == 1 and mousex >= 500 and mousex <= 550 and mousey >=200 and mousey <= 230 then
      mouse_comand_craft = true;
   end
end


function craft.draw()
	love.graphics.setColor(123, 12,53);
	if drawitem1 == true then
	love.graphics.circle("fill",item1.x,item1.y,10);
	end
	love.graphics.setColor(123, 120,13);
	if drawitem2 == true then
	love.graphics.circle("fill",item2.x,item2.y,10);
	end
	love.graphics.setColor(100, 12,123);
	if drawitem3 == true and mouse_comand_craft == true then
	love.graphics.rectangle("fill",item3.x,item3.y,40,40);
	end
	love.graphics.setColor(0,200,100)
	love.graphics.print("craft", 500,200,0,2)
end