Values = function(t)
	local i = 0
	local n = #t
	
	return function()
		i = i + 1
		if i <= n then
			return t[i]
		end
	end	
end

return Values
