Speak.lua DOCUMENTATION

-- Part 1 - Basic Usage

this is the setup of a Speak.lua script in Love2d:

------------------

script = {
    'Hi!',
    'This is Speak.lua!',
}

drawDialogBox(0, 400, 800, 200)
say('computer', script)

functions love.keypressed(key, scancode, isrepeat)
    if key == 'return' then
        sayNext()
    end
end


------------------

So what does this do?

Well, we create a script by making an array that holds a string of each line we want to say.
After that, we draw a dialog box at an x of 0 and a y of 400.
The box is 800x200 pixels in size.
We then use the 'say' function to tell Love2d to print the script - the name above the textbox will read 'computer'.

We then check if the return (A.K.A enter) key is pressed. If so, we say the next line in the script.
Speak automatically checks to make sure there's still lines to be said, so don't worry about that.


-- Part 2 - Advanced usage

This is an NPC script for the game Moth Warrior:

------------------

script = {
    "Hi! I'm the shopkeeper here in Arepeegeeland, and I sell potions.",
    "Would you like to buy anything?",
    "[y] - Buy Potion        [N] - Do Not",
}

function sayShopDialog()
    if dialogComplete == false then
        drawDialogBox(0, 400, 800, 200)
        say('Shopkeep', script)
        
        if pIS == 3 then
            if y_pressed then
                givePotion()
                dialogComplete = true
            elseif n_pressed then
                dialogComplete = true
            end
        end
        
    elseif dialogComplete == true then
        Room = 1
        pIS = 1
    end
end

function givePotion()
    oPlayer.potions = oPlayer.potions + 1
end

------------------
