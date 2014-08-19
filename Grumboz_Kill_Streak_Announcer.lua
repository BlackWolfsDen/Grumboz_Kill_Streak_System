-- By Slp13at420 of EmuDevs.com --
local Streak = {};
local Ann = {};

print("-----------------------------------")
print("Grumboz Kill Streak loading.")

local Ann = {
	[5] = {"`The Boring`", "has earned 5 kills."},
	[10] = {"`The Annoyance`", "is warming up with 10 kills."},
	[15] = {"`The Bloody`", "now has 15 kills under there belt."},
	[25] = {"`The War Machine`", "has reached 25 kills."},
	[50] = {"`The Widow Maker`", "has caused a blood bath by slaughtering 50 victims."},
	[75] = {"`The WarLord`", "walks thru the battlefield drenched with the blood of 75 victims."},
	[100] = {"`The Chaotic`", "is litteraly standing in his victims blood with 100 kills."},
	[125] = {"`The Reaper`", "has devistated the realm with 125 victims."},
	[150] = {"`The Destroyer of Worlds`", "Stands atop a pile of bodies of 150 victims."}
		}

function StreakKill(event, killer, victim)
local Kguid = killer:GetGUIDLow()
local Vguid = victim:GetGUIDLow()
local Kname = killer:GetName()
local Vname = victim:GetName()

	if(Streak[Kguid].prior~=Vguid)then
		Streak[Kguid].kills = (Streak[Kguid].kills + 1)
	
		if(Ann[Streak[Kguid].kills])then
			Streak[Kguid].title = Ann[Streak[Kguid].kills][1]
			SendWorldMessage("|cffcc0000"..Kname.." "..Streak[Kguid].title.." "..Ann[Streak[Kguid].kills][2].."|r")
		end
		if(Streak[Kguid].kills)then
			victim:SendBroadcastMessage("|cffcc0000You have fallen to "..Kname.." "..Streak[Kguid].title..".|r")
			Streak[Vguid].kills = 0
		end		
	else
		killer:SendBroadcastMessage("You cant kill the same player twice.")
	end
Streak[Kguid].prior = Vguid
end

function StreakLogin(event, killer)
local Kguid = killer:GetGUIDLow()
	Streak[Kguid] = {title = "`The Noob`", kills = 0, prior = 0}
end

RegisterPlayerEvent(6, StreakKill)
RegisterPlayerEvent(3, StreakLogin)

print("Counter started.")
print("-----------------------------------")
