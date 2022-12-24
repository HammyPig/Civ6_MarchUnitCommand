-- MarchUnitCommand_UnitCommandDefs
-- Author: James
-- DateCreated: 12/24/2022 2:50:00 PM
--------------------------------------------------------------

MarchUnitCommand = {};
MarchUnitCommand.properties = {};
MarchUnitCommand.EventName = "";
MarchUnitCommand.CategoryInUI = "SPECIFIC";
MarchUnitCommand.Icon = "";
MarchUnitCommand.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_MARCH_NAME") .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_MARCH_DESCRIPTION");
MarchUnitCommand.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_MARCH_DISABLED_TT");
MarchUnitCommand.VisibleInUI = true;

function MarchUnitCommand.CanUse(pUnit : object)
	if (pUnit:GetMovesRemaining() ~= pUnit:GetMaxMoves()) then
		return false;
	end
end

function MarchUnitCommand.IsVisible(pUnit : object)
	return pUnit ~= nil and pUnit:GetMovesRemaining() > 0;
end

function MarchUnitCommand.IsDisabled(pUnit : object)
	return (pUnit ~= nil and pUnit:GetMovesRemaining() == pUnit:GetMaxMoves());
end
