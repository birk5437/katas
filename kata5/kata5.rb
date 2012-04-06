#m = size of bitmap 
#k = # of hash functions
#n = elements in wordlist


def main
	bf = BloomFilter.new(7000, 5)
	bf.add_key("Burke")
	puts bf.get_hashes("Burke")
	puts bf.has_key?("Burke")
	#puts bf.bitmap

end


class BloomFilter

	attr_accessor :bitmap

	def initialize(m, k)
		@bitmap = []
		@k = k

		m.times do |b|
			@bitmap.push(false)
		end
	end

	def add_key(key)
		@k.times do |n|
			hash_function_n(key, n).split('').each_with_index do |item, index|
				@bitmap[index] = true if item == "1"
			end
		end
	end

	def has_key?(key)
		@k.times do |n|
			hash_function_n(key, n).split('').each_with_index do |item, index|
				if @bitmap[index] == false && item == "1"
					return false
				end
			end
		end
		return true
	end

	def get_hashes(key)
		@k.times do |n|
			puts "-----"
			str = hash_function_n(key, n)
			puts "N: #{n.to_s}"
			puts "Count: #{str.length}"
			puts str
			puts "-----"
		end
	end

	def hash_function_n(str, n)
		ret_val = str.each_byte.first
		i = 0
		reverse = false
		str.each_byte do |b|
			ret_val += (b * n * i)
			ret_val << i
	
			#if (n != 0 && i != 0 && (@bitmap.length % (n * i)) == 0)


#			while ret_val.to_s(2).length > @bitmap.length do
#				ret_val = ret_val << -1
#			end
	
			#ret_val = ret_val << (i * n * b)
			i += 1
		end

		if (n != 0 && i != 0)
			ret_val = ret_val << ((@bitmap.length / n) - ret_val.to_s(2).length).to_i
			reverse = true
		end
#		while ret_val.to_s(2).length < 15 do
#			ret_val = ret_val << 1
#		end

		return ret_val.to_s(2).reverse if reverse == true
		return ret_val.to_s(2)
	end

##########################

end






main

#bitArr = []
#50.times do
#  bitArr.push(0)
#end




