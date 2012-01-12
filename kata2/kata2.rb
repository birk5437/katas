#http://codekata.pragprog.com/2007/01/kata_two_karate.html

require 'rubygems'
require 'pry'

def roundDown(num)
	return num - (num % 1)
end

def chop(numToFind, arrNumbers)
	puts "arrNumbers: " + "#{arrNumbers}\n"
	puts "arrNumbers size (line 4): " + arrNumbers.size.to_s 
	if arrNumbers.size > 0
		tempArr = Array.new
		
		halfIndex = ((arrNumbers.size) / 2)
		if arrNumbers.size % 2 > 0 && arrNumbers.size > 1
			halfIndex = halfIndex + 1
		end

                if arrNumbers.size % 2 == 0 && arrNumbers.size > 2
			halfIndex += 1
                end

		#if halfIndex < 0
		#	halfIndex = 0
		#end

		puts "halfIndex:" + halfIndex.to_s()
	
		if arrNumbers.at(halfIndex) == numToFind
			puts "found!"
			return (halfIndex)
		elsif arrNumbers.at(halfIndex) > numToFind
			puts "arrNumbers(" + halfIndex.to_s + "): " + arrNumbers.at(halfIndex).to_s + " > " + numToFind.to_s			

			i=0
			loop {
				puts "loop #1...pushing " + arrNumbers.at(i).to_s + " to tempArr"
				tempArr.push(arrNumbers.at(i))
				break unless (i+=1) < halfIndex
			}

			if(tempArr.size == arrNumbers.size)
				tempArr.clear
			end
			#for i in 0..halfIndex
			#	tempArr.push(arrNumbers.at(i))
			#end

			puts "tempArr size: " + tempArr.size.to_s
			puts "tempArr: " + "#{tempArr}\n\n"

			#puts "#{tempArr}\n\n"
			#if (tempArr.size == 1)
			#	return chop(numToFind, tempArr) - halfIndex
			#else
				return chop(numToFind, tempArr)
			#end

		elsif arrNumbers.at(halfIndex) < numToFind
			puts "arrNumbers(" + halfIndex.to_s + "): " + arrNumbers.at(halfIndex).to_s + " < " + numToFind.to_s
			

			i = halfIndex

			puts "i before: " + i.to_s
			loop {
				puts "loop #2..pushing " + arrNumbers.at(i).to_s + " to tempArr"
				tempArr.push(arrNumbers.at(i))
				break unless (i+=1) < arrNumbers.size
			}
			puts "i after: " + i.to_s

			#while i < arrNumbers.size do
			#	puts "loop #2..pushing " + arrNumbers.at(i).to_s + " to tempArr"
			#	tempArr.push(arrNumbers.at(i))
			#	i+=1
			#end

			if tempArr.size == arrNumbers.size
				tempArr.clear
			end	

			#for i in halfIndex..arrNumbers.size
			#	tempArr.push(arrNumbers.at(i))
			#end
			puts "tempArr size: " + tempArr.size.to_s
			puts "tempArr: " + "#{tempArr}\n\n"
	
			if tempArr.size == 1
				return chop(numToFind, tempArr)
			else
				return chop(numToFind, tempArr) + (halfIndex)
			end
			#else
				#return chop(numToFind, tempArr)
			#end
		#else
		#	puts "number found!  at index: " + halfIndex.to_s()
		#	puts arrNumbers.at(halfIndex)
		#	return halfIndex
		end
	else
		puts "arrNumbers size: " + arrNumbers.size.to_s()
		puts "numToFind: " + numToFind.to_s()

		if (arrNumbers.size == 1 && arrNumbers.at(0) == numToFind)
			puts arrNumbers.at(0)
			puts "returning 0"
			return 0
		else
			if arrNumbers.size == 1
				puts "first arr element: " + arrNumbers.at(0).to_s()
			end
			puts "returning -1"
			return -1
		end
	end
end

numbers = [1, 3, 5]
#binding.pry
#retVal = chop(4, numbers)
#puts "retVal(1): " + retVal.to_s
#retVal = chop(1, numbers)
#puts "retVal(2): " + retVal.to_s
#retVal = chop(0, numbers)
#puts "retVal(3): " + retVal.to_s
numbers = [1, 3, 5, 7]
#retVal = chop(6, numbers)
retVal = chop(6, numbers)
puts "retVal(4): " + retVal.to_s
#numbers = Array(-5..101)
#retVal = chop(42, numbers)
#puts retVal
