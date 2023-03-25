--      RPG PROJECT IN LOVE2D

-- debug mode
debug = true    -- SET FALSE BEFORE SHIPPING

--      ROOM CHART:
-- 0 - Title
-- 1 - Overworld
-- 2 - Shop
-- 3 - Boss Room

Room = 0

--      PLAYER STATE CHART:
-- 0 - free
-- 1 - can't move

function love.load(dt)
    
    onShop = false
    
    y_pressed = false
    n_pressed = false
    
    player = require 'Scripts/player'
    playerLoad()
    arrowScript = require 'Scripts/arrowScript'
    arrowLoad()
    
    Speak = require 'Libraries/speak/speak'
    NPC = require 'Scripts/NPC'
    
    sti = require 'Libraries/sti'
    gameMap = sti('Maps/overworld.lua')
    
    menuImg = love.graphics.newImage('Assets/Menu.png')
    
    shopImg = love.graphics.newImage('Assets/shop.png')
    shopInside = love.graphics.newImage('Assets/shopInside.png')
    
    love.window.setMode(800, 600)
    
    shop = {x = 650, y = 450, img = shopImg}
    
end

function love.draw(dt)
    
    if Room == 0 then
        love.graphics.draw(menuImg, 0, 0)
    end
   
   if Room == 1 then 
        gameMap:draw()
        love.graphics.draw(shop.img, shop.x, shop.y)
        
        playerDraw()
        arrowDraw()
    end
   
   if Room == 2 then
        love.graphics.draw(shopInside, 0, 0)
        sayShopDialog()
    end
   
    if debug == true then
        love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    end
    
end

function love.update(dt)
    
    onShop = false
    
    if Room == 0 then
        if love.keyboard.isDown('space') then
            playerReset()
            Room = 1
        end
    end
    
    if Room == 1 then
        playerUpdate(dt)
        arrowUpdate(dt)
        
        if oPlayer.x > shop.x and oPlayer.x < shop.x + 128 and oPlayer.y > shop.y and oPlayer.y < shop.y + 128 then
            onShop = true
        end
        
    end
    
    
end

function love.keypressed(key, scancode, isrepeat)
    if Room == 2 then
        if key == 'return' then
            sayNext(script)
        end
        
        if pIS == 3 then
            if key == 'y' then
                y_pressed = true
            elseif key == 'n' then
                n_pressed = true
            end
        end
        
    elseif Room == 1 then
        if key == 'space' and onShop == true then
            dialogComplete = false
            Room = 2
        end
        
        if key == 'e' then
            if oPlayer.potions > 0 then
                oPlayer.potions = oPlayer.potions - 1
            end
        end
        
    end
    
    if debug == true then
        if key == 'f' then
            Room = 2
        end
        
        if key == 'q' then
            Room = 0
        end
    end
    
    if key == 't' then      -- REMOVE THIS
        debug = not debug
    end
    
end

