COMMAND = Clockwork.command:New("PlySetArmor");
COMMAND.tip = "Set a character's armor.";
COMMAND.text = "<string Name> [number Amount]";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "a";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] );
	local amount = arguments[2];
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		Clockwork.player:NotifyAll(player:Name().." has set "..target:Name().."'s armor to "..amount..".");
		
		target:SetArmor(amount);
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register()
