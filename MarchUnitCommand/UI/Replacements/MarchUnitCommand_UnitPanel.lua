-- MarchUnitCommand_UnitPanel
-- Author: James
-- DateCreated: 12/24/2022 3:28:05 PM
--------------------------------------------------------------

include "UnitPanel"
include "MarchUnitCommand_UnitCommandDefs"

BASE_GetUnitActionsTable = GetUnitActionsTable;
BASE_FilterUnitStatsFromUnitData = FilterUnitStatsFromUnitData;

function GetUnitActionsTable(pUnit: object)
	local pBaseActionsTable : table = BASE_GetUnitActionsTable(pUnit);

	local bVisible : boolean = true;
	if (MarchUnitCommand.IsVisible ~= nil) then
		bVisible = MarchUnitCommand.IsVisible(pUnit);
	end

	if (bVisible) then
		if (MarchUnitCommand.CanUse ~= nil and MarchUnitCommand.CanUse(pUnit) == true) then
			local bIsDisabled : boolean = false;
			if (MarchUnitCommand.IsDisabled ~= nil) then
				bIsDisabled = MarchUnitCommand.IsDisabled(pUnit);
			end
			
			local sToolTipString : string = MarchUnitCommand.ToolTipString or "Undefined Unit Command";

			local pCallback : ifunction = function()
				local pSelectedUnit = UI.GetHeadSelectedUnit();
				if (pSelectedUnit == nil) then
					return;
				end

				local tParameters = {};
				tParameters[UnitCommandTypes.PARAM_NAME] = MarchUnitCommand.EventName or "";
				UnitManager.RequestCommand(pSelectedUnit, UnitCommandTypes.EXECUTE_SCRIPT, tParameters);
			end

			if (bIsDisabled and MarchUnitCommand.DisabledToolTipString ~= nil) then
				sToolTipString = sToolTipString .. "[NEWLINE][NEWLINE]" .. MarchUnitCommand.DisabledToolTipString;
			end

			AddActionToTable(pBaseActionsTable, MarchUnitCommand, bIsDisabled, sToolTipString, UnitCommandTypes.EXECUTE_SCRIPT, pCallback);
		end
	end

	return pBaseActionsTable;
end
