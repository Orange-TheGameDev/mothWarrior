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

function bonkUpdate()
    for i, b in ipairs(boxes) do
        b.x = b.object.x
        b.y = b.object.y
    end
end

return boxes
