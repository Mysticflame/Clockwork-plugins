COMMAND = Clockwork.command:New("PlyFreeze");
COMMAND.tip = "Toggles freeze on a player.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "o";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
	
	if (target) then
		Clockwork.player:NotifyAll(player:Name().." has toggled freeze on '"..target:Name().."'.");
		
		if (target.froze) then
			target:Freeze(false)
			target.froze = false
		else
			target:Freeze(true)
			target.froze = true
		end
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register(COMMAND, "PlyFreeze");