COMMAND = Clockwork.command:New("CharGiveToolTrust");
COMMAND.tip = "Give or take ToolTrust (t flag).";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
	
	if (target) then
		if (!Clockwork.player:HasFlags(target, "t")) then
			Clockwork.player:NotifyAll(target:Name().." gave ToolTrust to "..player:Name()..".");
			Clockwork.player:GiveFlags(target, "t")
			target:SetData("tooltrust", 1)
			Clockwork.player:LightSpawn(target, true, true);
		else
			Clockwork.player:NotifyAll(target:Name().." took ToolTrust from "..player:Name()..".");
			Clockwork.player:TakeFlags(target, "t")
			target:SetData("tooltrust", 0)
			Clockwork.player:LightSpawn(target, true, true);
		end
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register()