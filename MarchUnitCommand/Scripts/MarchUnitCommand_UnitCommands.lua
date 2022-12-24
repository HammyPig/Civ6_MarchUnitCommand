-- MarchUnitCommand_UnitCommands
-- Author: James
-- DateCreated: 12/24/2022 3:09:33 PM
--------------------------------------------------------------

function UnitCommand_March(eOwner : number, iUnitID : number)
	local pPlayer = Players[eOwner];
	if (pPlayer == nil) then
		return;
	end

	local pUnit = pPlayer:GetUnits():FindID(iUnitID);
	if (pUnit == nil) then
		return;
	end

	local marchEnabled : number = GetObjectState(pUnit, g_PropertyKeys.marchEnabled);
	if (marchEnabled == 1) then
		return;
	end

	UnitManager.ChangeMovesRemaining(pUnit, 2);

	SetObjectState(pUnit, g_PropertyKeys.marchEnabled, 1);
end
