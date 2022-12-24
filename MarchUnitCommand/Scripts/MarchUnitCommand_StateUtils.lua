-- MarchUnitCommand_StateUtils
-- Author: James
-- DateCreated: 12/24/2022 6:59:14 PM
--------------------------------------------------------------

g_PropertyKeys = {
	marching = "marching"
};

local USE_CACHE : boolean = true;
local g_ObjectStateCache = {};

function SetObjectState(pObject : object, sPropertyName : string, value)
	if (sPropertyName == nil) then
		return nil;
	end

	if (pObject == nil) then
		return nil;
	end

	if (USE_CACHE == true) then
		if (g_ObjectStateCache[pObject] == nil) then
			g_ObjectStateCache[pObject] = {};
		end

		g_ObjectStateCache[pObject][sPropertyName] = value;
	end

	if UI ~= nil then
		local kParameters:table = {};
		kParameters.propertyName = sPropertyName;
		kParameters.value = value;
		kParameters.objectID = pObject:GetComponentID();

		kParameters.OnStart = "OnPlayerCommandSetObjectState";

		UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.EXECUTE_SCRIPT, kParameters);
	else
		if (pObject.SetProperty ~= nil) then
			pObject:SetProperty(sPropertyName, value);
		end
	end
end

function OnPlayerCommandSetObjectStateHandler(ePlayer : number, params : table)
	local pObject = Game.GetObjectFromComponentID(params.objectID);

	if pObject ~= nil then
		SetObjectState(pObject, params.propertyName, params.value);
	end
		
end

if UI == nil then
	GameEvents.OnPlayerCommandSetObjectState.Add(OnPlayerCommandSetObjectStateHandler);
end

function GetObjectState(pObject : object, sPropertyName : string, bCacheCheckOnly : boolean)
	if (sPropertyName == nil) then
		return nil;
	end

	if (pObject == nil) then
		return nil;
	end

	bCacheCheckOnly = bCacheCheckOnly or false;

	if (USE_CACHE == true) then
		if (g_ObjectStateCache[pObject] == nil) then
			g_ObjectStateCache[pObject] = {};
		end

		if (g_ObjectStateCache[pObject][sPropertyName] ~= nil) then
			return g_ObjectStateCache[pObject][sPropertyName];
		else
			if (bCacheCheckOnly) then
				return nil;
			else
				return RefreshObjectState(pObject, sPropertyName);
			end
		end
	else
		return pObject:GetProperty(sPropertyName);
	end
end

function RefreshObjectState(pObject : object, sPropertyName : string)
	if (sPropertyName == nil) then
		return nil;
	end

	if (pObject.GetProperty == nil) then
		return nil;
	end	

	local propResult = pObject:GetProperty(sPropertyName);

	if (g_ObjectStateCache[pObject] == nil) then
		g_ObjectStateCache[pObject] = {};
	end

	g_ObjectStateCache[pObject][sPropertyName] = propResult;
	return propResult;
end
