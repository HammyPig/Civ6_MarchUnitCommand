-- MarchUnitCommand_UnitCommandDefs
-- Author: James
-- DateCreated: 12/24/2022 2:50:00 PM
--------------------------------------------------------------

MarchUnitCommand = {};
MarchUnitCommand.properties = {};
MarchUnitCommand.EventName = "UnitCommand_March";
MarchUnitCommand.CategoryInUI = "SPECIFIC";
MarchUnitCommand.Icon = "ICON_UNITOPERATION_MOVE_TO";
MarchUnitCommand.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_MARCH_NAME") .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_MARCH_DESCRIPTION");
MarchUnitCommand.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_MARCH_DISABLED_TT");
MarchUnitCommand.VisibleInUI = true;

function MarchUnitCommand.CanUse(pUnit : object)
	return pUnit ~= nil and pUnit:GetMaxMoves() > 0;
end

function MarchUnitCommand.IsVisible(pUnit : object)
	return pUnit ~= nil;
end

function MarchUnitCommand.IsDisabled(pUnit : object)
	return pUnit == nil or pUnit:GetDamage() >= 99;
end
