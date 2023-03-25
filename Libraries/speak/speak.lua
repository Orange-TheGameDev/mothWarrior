-- Dialog System

pIS = 1
dialogComplete = false

optionPoint = 0

function drawDialogBox(x, y, w, h)
    
    box_x = x
    box_y = y
    
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle("fill", x, y, w, h)
    love.graphics.rectangle('fill', x, y-40, w/4, 40)
    
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle("line", x, y, w, h)
    love.graphics.rectangle("line", x, y-40, w/4, 40)
    
end

function say(name, script)
    love.graphics.print(name, box_x + 15, box_y - 27)
    love.graphics.print(script[pIS], box_x + 10, box_y + 10)
end

function sayNext(script)
    if pIS < #script then
        pIS = pIS + 1
    elseif pIS == #script then
        dialogEnd()
    end
end

function dialogEnd()
    dialogComplete = true
end
