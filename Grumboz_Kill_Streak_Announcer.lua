-- By Slp13at420 of EmuDevs.com --
Streak = {};
Ann = {};

print("\n-----------------------------------")
print("Grumboz Kill Streak loading.")

Ann = {
	[5] = {"`The Noob`", "has earned 5 kills."},
	[10] = {"`The Boring`", "is warming up with 10 kills."},
	[25] = {"`The War Machine`", "has reached 25 kills."},
	[50] = {"`The Widow Maker`", "has caused a blood bath by slaughtering 50 victims."},
	[75] = {"`The WarLord`", "walks thru the battlefield drenched with the blood of 75 victims."},
	[100] = {"`The Chaotic`", "is litteraly standing in his victims blood with 100 kills."},
	[125] = {"`The Reaper`", "has devistated the realm with 125 victims."},
	[150] = {"`The Destroyer of Worlds`", "Stands atop a pile of bodies of 150 victims."}
		}

function StreakKill(event, killer, killed)

	if(Streak[killer:GetName()].prior~=killed:GetName())then
		Streak[killer:GetName()].kills = (Streak[killer:GetName()].kills + 1)
	
		if(Ann[Streak[killer:GetName()].kills])then
			Streak[killer:GetName()].title = Ann[Streak[killer:GetName()].kills][1]
			SendWorldMessage("|cffcc0000"..killer:GetName().." "..Ann[Streak[killer:GetName()].kills][1].." "..Ann[Streak[killer:GetName()].kills][2].."|r")
		end
		if(Streak[killer:GetName()].kills)then
			SendWorldMessage("|cffcc0000"..killed:GetName().." Has fallen to "..killer:GetName().." "..Streak[killer:GetName()].title..".|r")
			Streak[killed:GetName()].kills = 0
		end		
	else
		killer:SendBroadcastMessage("You cant kill the same player twice.")
	end
Streak[killer:GetName()].prior = killed:GetName()
end

function StreakLogin(event, killer)
	Streak[killer:GetName()] = {title = "`The Fodder`", kills = 0, prior = ""}
end

RegisterPlayerEvent(6, StreakKill)
RegisterPlayerEvent(3, StreakLogin)

print("Counter started.")
print("-----------------------------------")
