--[[

  Functions the same way as the range method in python:

  for i in range(5) do
    -- Some code using i in range 5
  end

  Again, as is true with all generic closure loops, there is a faster method available to do it, however, this is more reminiscent of python
  which is nicer for me personally.

]]--

local rangeIterator = function(n)
  local i = 0;
  
  return function()
    i = i + 1;
    if i <= n then
      return i;
    end
  end
end

return rangeIterator
