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

	-- gain extra movement
	pUnit:ChangeMovesRemaining(pUnit:GetMaxMoves());

	-- at the cost of half your health
	local health = 100 - pUnit:GetDamage()
	health = math.ceil(health / 2);
	pUnit:SetDamage(100 - health);

	return;
end

GameEvents.UnitCommand_March.Add(UnitCommand_March)
