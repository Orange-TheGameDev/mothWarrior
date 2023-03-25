-- PLAYER SCRIPT
oPlayer = {x = 50, y = 50, width = 32, height = 32, speed = 3, state = 0, img = nil, potions = 0}

playerTimer = nil

createCollisionBox(oPlayer, 32, 32)

function playerLoad()
    
    playerRight = love.graphics.newImage('Assets/playerRight.png')
    playerLeft = love.graphics.newImage('Assets/playerLeft.png')
    playerUp = love.graphics.newImage('Assets/playerUp.png')
    playerDown = love.graphics.newImage('Assets/playerDown.png')
    
    playerBow = love.graphics.newImage('Assets/Bow.png')
    bowLengthX = 20
    bowAngle = 0
    
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    
    oPlayer.img = playerDown
    
end

function GetInput()
    
    if oPlayer.state == 0 then
        if love.keyboard.isDown('w') then
            oPlayer.y = oPlayer.y - oPlayer.speed
            oPlayer.img = playerUp
        elseif love.keyboard.isDown('s') then
            oPlayer.y = oPlayer.y + oPlayer.speed
            oPlayer.img = playerDown
        end
        
        if love.keyboard.isDown('a') then
            oPlayer.x = oPlayer.x - oPlayer.speed
            oPlayer.img = playerLeft
        elseif love.keyboard.isDown('d') then
            oPlayer.x = oPlayer.x + oPlayer.speed
            oPlayer.img = playerRight
        end
        
        
    end
    
end

function playerReset()
    oPlayer.x =50
    oPlayer.y = 50
    oPlayer.img = playerDown
    oPlayer.state = 0
end

function playerUpdate(dt)
    GetInput()
    bowAngle = math.atan2((mouseY - oPlayer.y + oPlayer.img:getHeight()/2), (mouseX - oPlayer.x + oPlayer.img:getWidth()/2))
    
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    
end

function playerDraw()
    
    love.graphics.print('Potions: '..tostring(oPlayer.potions), 720, 0)
    
    love.graphics.draw(oPlayer.img, oPlayer.x, oPlayer.y)
    love.graphics.draw(playerBow, oPlayer.x + oPlayer.img:getWidth()/2, oPlayer.y + oPlayer.img:getHeight()/2, bowAngle, 1, 1, 0, playerBow:getHeight()/2)
end

function love.mousepressed(x, y, button)
	if button == 1 then
		local startX = oPlayer.x + playerBow:getWidth()/2
		local startY = oPlayer.y + playerBow:getHeight()/2
		local mouseX = x
		local mouseY = y
		
		local angle = math.atan2((mouseY - startY), (mouseX - startX))
		
		local arrowDx = arrowSpeed * math.cos(angle)
		local arrowDy = arrowSpeed * math.sin(angle)
		
		table.insert(arrows, {x = startX, y = startY, dx = arrowDx, dy = arrowDy, angle = bowAngle})
	end
end
