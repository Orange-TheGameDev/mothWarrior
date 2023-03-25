
function arrowLoad()
    
    arrow = love.graphics.newImage('Assets/Arrow.png')
    
    arrowSpeed = 250
    arrows = {}
end

function arrowDraw()
    
    for i, v in ipairs(arrows) do
        love.graphics.draw(arrow, v.x, v.y, v.angle)
    end
    
end

function arrowUpdate(dt)
    for i, v in ipairs(arrows) do
        v.x = v.x + (v.dx * dt)
        v.y = v.y + (v.dy * dt)
    end
end
