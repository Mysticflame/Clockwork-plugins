--[[
	Name: sv_auto.lua.
	Author: Snazzy.
--]]

local PLUGIN = PLUGIN;
PLUGIN.classDoors = {};

-- A function to get whether a player has a flashlight.
function PLUGIN:AddClassDoor(class, doorName)
	if(!self.classDoors[doorName])then
		self.classDoors[doorName] = {};
	end;
	
	table.insert(self.classDoors[doorName], class);
end;

--[[
	You can easily add a door, that can only be accessed by a certain class by doing:		
		PLUGIN:AddClassDoor(Class Enumeration, Door Name);
	As shown in the examples below
--]]
PLUGIN:AddClassDoor(CLASS_CITIZEN, "Super Rebel Base");