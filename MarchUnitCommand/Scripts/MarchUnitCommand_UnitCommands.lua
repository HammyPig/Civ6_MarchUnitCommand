-- MarchUnitCommand_UnitCommands
-- Author: James
-- DateCreated: 12/24/2022 3:09:33 PM
--------------------------------------------------------------

include "MarchUnitCommand_StateUtils"

function UnitCommand_March(eOwner : number, iUnitID : number)
	local pPlayer = Players[eOwner];
	if (pPlayer == nil) then
		return;
	end

	local pUnit = pPlayer:GetUnits():FindID(iUnitID);
	if (pUnit == nil) then
		return;
	end

	local marching : number = GetObjectState(pUnit, g_PropertyKeys.marching);
	if (marching == 1) then
		return;
	end

	UnitManager.ChangeMovesRemaining(pUnit, 2);

	SetObjectState(pUnit, g_PropertyKeys.marching, 1);
end

GameEvents.UnitCommand_March.Add(UnitCommand_March)
