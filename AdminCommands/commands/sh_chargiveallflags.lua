COMMAND = Clockwork.command:New("CharGiveAllFlags")
COMMAND.tip = "Give or take All Flags.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
	
	if (target) then
		if (!Clockwork.player:HasFlags(target, "AaBbCcDdEeFfGGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890")) then
			Clockwork.player:NotifyAll(player:Name().." gave AllFlags to "..target:Name()..".");
			Clockwork.player:GiveFlags(target, "AaBbCcDdEeFfGGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890")
			target:SetData("allflags", 1)
			Clockwork.player:LightSpawn(target, true, true);
		else
			Clockwork.player:NotifyAll(player:Name().." took AllFlags to "..target:Name()..".");
			Clockwork.player:TakeFlags(target, "AaBbCcDdEeFfGGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890")
			target:SetData("allflags", 0)
			Clockwork.player:LightSpawn(target, true, true);
		end
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();