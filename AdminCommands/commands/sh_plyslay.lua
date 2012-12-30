COMMAND = Clockwork.command:New("PlySlay");
COMMAND.tip = "Slays a player.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
	
	if (target) then
		Clockwork.player:NotifyAll(player:Name().." has slayed '"..target:Name().."'.");
		
		target:Kill()

	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register(COMMAND, "PlySlay");