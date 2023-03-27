# Bonk!

Bonk is a short and simple Lua library for collisions.

It's currently in early stages, and as such only does AABB collisions with rectangles.

It was made during the development of Moth Warrior, mostly because I wanted to use as little libraries as possible.

## How To Use

Bonk is made with simplicity in mind.

Here's an example:

```
objectPlayer = {x = 50, y = 64, img = imageClass}

createCollisionBox(objectPlayer, 64, 64)

objectThing = {x = 100, y = 64, img = imageClass}

createCollisionBox(objectThing, 64, 64)

function update()
    bonkUpdate()
    
    if checkOverlap(objectPlayer.bbox, objectThing.bbox) then
        doStuff()
    end
    
end
```

But what does each function do?

| Command     | Description | Use     |
| :---        |    :----:   |          ---: |
| createCollisionBox(gameObject, width, height)      | Creates a bounding box (or bbox for short) and appends it to the provided game object.       | createCollisionBox(player, 64, 64)   |
| Paragraph   | Text        | And more      |