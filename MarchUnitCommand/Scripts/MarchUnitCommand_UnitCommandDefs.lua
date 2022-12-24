-- MarchUnitCommand_UnitCommandDefs
-- Author: James
-- DateCreated: 12/24/2022 2:50:00 PM
--------------------------------------------------------------

MarchUnitCommand = {};
MarchUnitCommand.properties = {};
MarchUnitCommand.EventName = "";
MarchUnitCommand.CategoryInUI = "SPECIFIC";
MarchUnitCommand.Icon = "ICON_UNITOPERATION_MOVE_TO";
MarchUnitCommand.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_MARCH_NAME") .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_MARCH_DESCRIPTION");
MarchUnitCommand.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_MARCH_DISABLED_TT");
MarchUnitCommand.VisibleInUI = true;

function MarchUnitCommand.CanUse(pUnit : object)
	return	pUnit ~= nil;
end

function MarchUnitCommand.IsVisible(pUnit : object)
	return (pUnit ~= nil and pUnit:GetMovesRemaining() > 0);
end

function MarchUnitCommand.IsDisabled(pUnit : object)
	return (pUnit == nil or pUnit:GetMovesRemaining() ~= pUnit:GetMaxMoves());
end
