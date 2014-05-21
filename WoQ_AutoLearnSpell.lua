--[[
    - Developer(s): Whiroph
    - Thanks to: Eluna Devs & µDev (for base)
    - Complete: %100
    - ScriptName: 'Player_LearnReferenceSpellsOnLevelUp'
]]
 
local ClassesSpellsReference = {
        -- Warrior
    [1] = {
                -- All
        ["all"]  = {200001,200002},
                -- Alliance only
        [0]  = {},
                -- Horde only
        [1]  = {}
    },
        -- Paladin
    [2] = {
        ["all"]  = {200003,200004},
        [0]  = {200020},
        [1]  = {200021}
    },
        -- Hunter
        [3] = {
        ["all"]  = {200013,200014},
        [0]  = {},
        [1]  = {}
        },
        -- Rogue
        [4] = {
        ["all"]  = {200015,200016},
        [0]  = {},
        [1]  = {}
        },
        -- Priest
        [5] = {
        ["all"]  = {200011,200012},
        [0]  = {},
        [1]  = {}
        },
        -- DeathKnight
        [6] = {
        ["all"]  = {200019},
        [0]  = {},
        [1]  = {}
        },
        -- Shaman
        [7] = {
        ["all"]  = {200017,200018}, -- 200018 Contain: 2825 Bloodlust (only for horde shamans),  32182 Heroism (only for alliance shamans)
        [0]  = {},
        [1]  = {}
        },
        -- Mage
        [8] = {
        ["all"]  = {200007,200008},
        [0]  = {},
        [1]  = {}
        },
        -- Warlock
        [9] = {
        ["all"]  = {200009,200010},
        [0]  = {},
        [1]  = {}
        },
        -- Druid
        [11] = {
        ["all"]  = {200005,200006},
        [0]  = {},
        [1]  = {}
        }
}
 
function Player_LearnReferenceSpellsOnLevelUp(event, player, oldLevel)
        local References = ClassesSpellsReference[player:GetClass()]
        local Delevelling = false
        if (oldLevel >= player:GetLevel()) then
                Delevelling = true
        end
        local SQL_Spells = "SELECT spell FROM npc_trainer WHERE reqlevel"
        if(Delevelling == true) then
                SQL_Spells = SQL_Spells..">"
        else
                SQL_Spells = SQL_Spells.."<="
        end
        SQL_Spells = SQL_Spells..player:GetLevel().." AND reqskill = 0 AND entry IN ("
        for key, value in ipairs(References['all']) do
                if(key <= 1) then
                        SQL_Spells = SQL_Spells..value
                else
                        SQL_Spells = SQL_Spells..","..value
                end
    end
        for key, value in ipairs(References[player:GetTeam()]) do
                SQL_Spells = SQL_Spells..","..value
    end
        SQL_Spells = SQL_Spells..")"
        local QUERY_Spells = WorldDBQuery(SQL_Spells)
        local SpellID = 0
    if(QUERY_Spells) then
        repeat
                        SpellID = QUERY_Spells:GetUInt32(0)
                        if(Delevelling == true) then
                                player:RemoveSpell(SpellID)
                        else
                                player:LearnSpell(SpellID)
                        end
        until not QUERY_Spells:NextRow()
    end
end
RegisterPlayerEvent(13, Player_LearnReferenceSpellsOnLevelUp) -- PLAYER_EVENT_ON_LEVEL_CHANGE