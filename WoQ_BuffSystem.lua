--Credits: uDev (http://emudevs.com/showthread.php/2008-Advanced-Buff-script)

local Cost = 10000 -- Edit this with coinage that is needed for power buff currently 1gold needed!
local BUFFIDS = {48074, 48170, 43223, 36880, 467, 48469, 48162} -- add/remove spell IDs for buffs (used in the buff command).    
local POWERBUFFIDS = {48074, 48170, 43223, 36880, 467, 48469, 48162, 41924} -- add/remove spell IDs for buffs (used in the buff command).    
     
function Buff(event, player, message, type, language)
    if(message:lower() == "#buff") then
        if (player:GetCoinage() >= Cost) then
        player:ModifyMoney(-Cost) -- Remove this line if you don't want player to loose golds.
                for k, v in pairs(POWERBUFFIDS) do
                        player:AddAura(v, player)
                        end
        else
        for k, v in pairs(BUFFIDS) do
                        player:AddAura(v, player)
                        end
                        end
        player:SendBroadcastMessage("|cff00ff00Buffed!|r")
    return false
        end
end
 
RegisterPlayerEvent(18, Buff)