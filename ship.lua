local ship = {};
ship.x = love.graphics.getWidth()/2;
 
local bullets = {};
 
local blocks = {};
 
local h = love.graphics.getHeight() - 30;
 
function love.load()
    for i=1,15 do
        for j=0,4 do
            blocks[i+j*15] = {
                x=80+i*45,
                y=100+j*30,
            }
        end
    end
end
 

 
local speed = 100;
local b_speed = 300;
local block_sp = 40;
 
local b_interval = 0.5;
local shooted_time = 0.0;
 
function love.update(dt)
    if love.keyboard.isDown('left') then
        ship.x = ship.x - speed*dt;
    end
    if love.keyboard.isDown('right') then
        ship.x = ship.x + speed*dt;
    end
 
    shooted_time = shooted_time + dt;
    if (shooted_time>=b_interval) and love.keyboard.isDown('space') then
        bullets[#bullets+1] = {x = ship.x+10, y = h};
        shooted_time = 0.0;
    end
 
    for i = #bullets,1,-1 do
        local b = bullets[i];
        b.y = b.y - b_speed*dt;
        for j = #blocks,1,-1 do
            local bl = blocks[j];
            if (b.x > bl.x)
                and (b.x < bl.x+30)
                and (b.y < bl.y+20)
            then
                b.dead = true;
                table.remove(blocks,j);
                break;
            end
        end
        if (b.y < 0)or(b.dead) then
            table.remove(bullets,i);
        end
    end
 
    for i = #blocks,1,-1 do
        local bl = blocks[i];
        bl.y = bl.y + block_sp*dt;
        if (bl.y > h+300) then
            table.remove(bullets,i);
        end
    end
end
 
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0);
    end
end
function love.draw()
    love.graphics.setColor(0,200,0);
    love.graphics.rectangle('fill',ship.x,h,20,20);
 
    love.graphics.setColor(200,0,0);
    for i,b in ipairs(bullets) do
        love.graphics.circle('fill',b.x, b.y,2);
    end
 
    love.graphics.setColor(0,0,200);
    for i,b in ipairs(blocks) do
        love.graphics.rectangle('fill',b.x,b.y,30,20);
    end
end