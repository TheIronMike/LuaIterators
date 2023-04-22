--[[

    This is not the most efficient way to check if something is alive or dead. What it does allow, however, is the following code:

    for character in aliveInstances(Players:GetChildren()) do
        -- Some block of code that uses any characters who are alive
    end

    Basically, it makes code more easy to read, and shorter in length. There are not many situations where the runtime difference between a generic closure iteration and
    regular iteration (with next, pairs, ipairs, etc) matters for checking living instances in LuaU.

]]--
aliveInstance = function(Object: Player | Model): boolean
	if Object:IsA("Player") then
		Object = Object.Character or Object.CharacterAdded:Wait()
	end

	if Object then
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			return Humanoid:GetState() ~= Enum.HumanoidStateType.Dead
		end
	end
end

aliveInstances = function(objectList)
	local i = 0
	local n = #objectList

  -- Utilizes tailcalls [https://www.lua.org/pil/6.3.html] so that it does not take up any additional memory when it iterates over dead players/instances
	local tailCall
	tailCall = function()
		i = i + 1

		if i <= n and objectList[i] and aliveInstance(objectList[i]) then
			return objectList[i]
		elseif i <= n and objectList[i] and not aliveInstance(objectList[i]) then
			return tailCall()
		end
	end

	return tailCall
end

return aliveInstances
