--[[
  
  Utilizes a passed in function to the iterator to determine whether or not a value from an array is allowed. Passed in function must return a value

  Example code:

  local genericCheck = ...

  local values = {"A", "B", "C"}

  for value in genericCheck(values, function(x) return x ~= "B" end) do
    print(value)
  end

  -- Prints: A, C
]]

genericCheck = function(list, f)
	local i = 0
	local n = #list

	local tailCall
	tailCall = function()
		i = i + 1

		if i <= n and list[i] and f(list[i]) then
			return list[i]
		elseif i <= n then
			return tailCall()
		end
	end

	return tailCall
end

return genericCheck
