COMMAND = Clockwork.command:New("CharGivePet");
COMMAND.tip = "Give or take ToolTrust and PhysGunTrust(pet Flags).";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
	
	if (target) then
		if (!Clockwork.player:HasFlags(target, "pet")) then
			Clockwork.player:NotifyAll(player:Name().." gave AllTrusts to "..target:Name()..".");
			Clockwork.player:GiveFlags(target, "pet")
			target:SetData("phystrust", 1)
			target:SetData("tooltrust", 1)
			Clockwork.player:LightSpawn(target, true, true);
		else
			Clockwork.player:NotifyAll(player:Name().." gave AllTrusts to "..target:Name()..".");
			Clockwork.player:TakeFlags(target, "pet")
			target:SetData("phystrust", 0)
			target:SetData("tooltrust", 0)
			Clockwork.player:LightSpawn(target, true, true);
		end
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();