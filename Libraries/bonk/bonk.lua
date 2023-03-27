-- bonk - custom collision library for Lua games

boxes = {}

function createCollisionBox(gameObject, w, h)
    gameObject.bbox = {object = gameObject, x = gameObject.x, gameObject.y, w = w, h = h}
    table.insert(boxes, gameObject.bbox)
end

function checkOverlap(box1, box2)
    if box1.x < box2.x + box2.w and
    box1.x + box1.w > box2.x and
    box1.y < box2.y + box2.h and
    box1.h + box1.y > box2.y then
        return true
    end
    
    return false
    
end

function advancedOverlap(x1, x2, y1, y2, w1, w2, h1, h2)
    if x1 < x2 + w2 and
    x1 + w1 > x2 and
    y1 < y2 + h2 and
    h1 + y1 > y2 then
        return true
    end
    
    return false
end

function bonkUpdate()
    for i, b in ipairs(boxes) do
        b.x = b.object.x
        b.y = b.object.y
    end
end

return boxes
