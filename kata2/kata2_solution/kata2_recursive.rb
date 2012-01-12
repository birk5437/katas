def chop(key, arrNumbers, low=0, high=arrNumbers.size - 1)

	if (high < low)
		return -1
	end

	mid = (low + high) / 2

	if arrNumbers.at(mid) > key
		return chop(key, arrNumbers, low, mid - 1)
	elsif arrNumbers.at(mid) < key
		return chop(key, arrNumbers, mid + 1, high)
	else
		return mid
	end

end

#Test
=begin
numbers = [1, 3, 5, 7]
retVal = chop(7, numbers)
puts "retVal: " + retVal.to_s
=end
