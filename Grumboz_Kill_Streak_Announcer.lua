-- By Slp13at420 of EmuDevs.com --
Streak = {};
Ann = {};

print("\n-----------------------------------")
print("Grumboz Kill Streak loading.")

Ann = {
	[5] = "a noob has reached 10 kills.",
	[10] = " is warming up and has reached 10 kills.",
	[25] = " The WarLord has reached 25 kills.",
	[50] = "has caused a blood bath by slaughtering 50 players."
		}

function StreakKill(event, killer, killed)

	if(Streak[killer:GetName()].prior~=killed:GetName())then
	
		if(Ann[Streak[killer:GetName()].kills])then
			Streak[killer:GetName()].kills = (Streak[killer:GetName()].kills + 1)
			SendWorldMessage("|cff00cc00"..killer:GetName().." "..Ann[Streak[killer:GetName()].kills].."|r")
		end
		if(Streak[killer:GetName()].kills)then
			SendWorldMessage("|cffcc0000"..killed:GetName().." Has fallen to "..killer:GetName()..".|r")
			Streak[killed:GetName()].kills = 0
		end		
	else
		killer:SendBroadcastMessage("You cant kill the same player twice.")
	end
Streak[killer:GetName()].prior = killed:GetName()
end

function StreakLogin(event, killer)
	Streak[killer:GetName()] = {kills = 0, prior = "none"}
end

RegisterPlayerEvent(6, StreakKill)
RegisterPlayerEvent(3, StreakLogin)

print("Counter started.")
print("-----------------------------------")
