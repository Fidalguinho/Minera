local blessPrice = 10000 -- preço em Gold Coins.

local function haveAllBlessings(player)
    local blessingsCount = 0
    for blessing = 1, 8 do
        if player:hasBlessing(blessing) then
            blessingsCount = blessingsCount + 1
        end
    end
    
    return blessingsCount == 8
end

function onSay(player, words, param)
    if haveAllBlessings(player) then
        return player:sendTextMessage(MESSAGE_INFO_DESCR, "You have already been blessed by the gods.") and true
    end
    
    if not player:removeMoney(blessPrice) then
        return player:sendCancelMessage("You do not have enough money.") and true
    end
    
    for blessing = 1, 8 do
        if not player:hasBlessing(blessing) then
            player:addBlessing(blessing, 1)
        end
    end
    
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You have bought all blessings.")
    
    return true
end