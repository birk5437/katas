class ChopIter
	def chop (key, arrNumbers)
	
		low = 0
		high = arrNumbers.size - 1
		
		while low <= high
			mid = (low + high) / 2
	
			if key == arrNumbers.at(mid)
				return mid
			elsif key < arrNumbers.at(mid)
				high = mid - 1
			else
				low = mid + 1
			end
		end
	
		return -1
	end
end

#numbers = Array(0..10000000)
#numbers = [1, 3, 5, 7]
#retVal = chop(-34023, numbers)
#puts "retVal: " + retVal.to_s
