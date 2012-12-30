local Clockwork = Clockwork;

local PLUGIN = PLUGIN;

function PLUGIN:GetPlayerScoreboardOptions(player, options, menu)

	local plyFreeze = self.command:Get("PlyFreeze");
	local plySlay = self.command:Get("PlySlay");

	if ( plyFreeze and self.player:HasFlags(self.Client, plyFreeze.access) ) then
		options["Freeze/UnFreeze Player"] = function()
			Clockwork.kernel:RunCommand("PlyFreeze", player:Name());
		end;
	end;

	if ( plySlay and self.player:HasFlags(self.Client, plySlay.access) ) then
		options["Slay Player"] = function()
			Clockwork.kernel:RunCommand("PlySlay", player:Name());
		end;
	end;	

end