--Don't use without a triggerHook logic applied to Eluna GiveXP to prevent xp loop.

local function pLogin(event, player)
	local pAccountID = player:GetAccountId()
	local SQL_pMaxLevel = "SELECT COUNT(*) FROM characters WHERE level=80 AND account="..pAccountID..";"
	
	local QUERY_MaxLevelCount = CharDBQuery(SQL_pMaxLevel)
	local pMaxLevel = QUERY_MaxLevelCount:GetUInt32(0)
	
	if(pMaxLevel >= 1) then
		player:SendBroadcastMessage("[WoQ] Bonus d'expérience activé. "..pMaxLevel.." personnage(s) niveau 80.")
	end
end

local function pGainExp(event, player, amount, victim)
    local victim = null
	local pAccountID = player:GetAccountId()
	local SQL_pMaxLevel = "SELECT COUNT(*) FROM characters WHERE level=80 AND account="..pAccountID..";"
	
	local QUERY_MaxLevelCount = CharDBQuery(SQL_pMaxLevel)
	local pMaxLevel = QUERY_MaxLevelCount:GetUInt32(0)
	
	if(pMaxLevel >= 1) then -- Check if the account has at least 1 level 80.
		if (pMaxLevel == 1) then
		local BonusPercent = amount
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 2) then
		local BonusPercent = amount * 2
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 3) then
		local BonusPercent = amount * 3
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 4) then
		local BonusPercent = amount * 4
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 5) then
		local BonusPercent = amount * 5
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 6) then
		local BonusPercent = amount * 6
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 7) then
		local BonusPercent = amount * 7
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 8) then
		local BonusPercent = amount * 8
		player:GiveXP(BonusPercent, victim, false, 1.0)
		elseif (pMaxLevel == 9) then
		local BonusPercent = amount * 9
		player:GiveXP(BonusPercent, victim, false, 1.0)
		else
		end
	end
end

RegisterPlayerEvent(3, pLogin)
RegisterPlayerEvent(12, pGainExp)

