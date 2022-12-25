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

	-- gain 2x movement (+1 to make up for the fact you have to heal)
	pUnit:ChangeMovesRemaining(3 * pUnit:GetMaxMoves());

	-- at the cost of 10 hp
	pUnit:SetDamage(pUnit:GetDamage() + 10);

	return;
end

GameEvents.UnitCommand_March.Add(UnitCommand_March)
