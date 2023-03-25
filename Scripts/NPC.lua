-- NPC TIME !!

script = {
    "Hey kid, my name is Mono.",
    "See anything that you'd want?",
    "[y] - buy potion    [n] - do not",
}

function sayShopDialog()
    if dialogComplete == false then
        drawDialogBox(0, 0, 800, 100)
        say('Shopkeep', script)
        
        if pIS == 3 then
            if y_pressed then
                givePotion()
                dialogComplete = true
                y_pressed = false
                n_pressed = false
            elseif n_pressed then
                dialogComplete = true
                y_pressed = false
                n_pressed = false
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