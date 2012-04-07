class BloomFilter

	attr_accessor :bitmap

	def initialize(mval, k)
		@bitmap = []
		@k = k
		@m = mval

		#m.times do |b|
		#	@bitmap.push(false)
		#end
	end

	def read_file(filename = "/usr/share/dict/words", lines = 1000)
		word_count = 0
		File.open(filename).each_line do |word|
			puts "adding #{word}"
			self.add_key(word)
			word_count += 1
			puts word_count.to_s if word_count % 100 == 0
			break if word_count % lines == 0
		end
	end

	def add_key(key)
		@k.times do |n|
			hash_function_n(key, n).split('').each_with_index do |item, index|
				if item == "1"
					@bitmap[index] = true
				#else
					#@bitmap[index] = false
				end
			end
		end
	end

	def has_key?(key)
		@k.times do |n|
			hash_function_n(key, n).split('').each_with_index do |item, index|
				if (@bitmap[index] == false || @bitmap[index] == nil) && item == "1"
					return false
				end
			end
		end
		return true
	end

	def get_bits(key)
		bits = []

	end

	def true_bits
		@bitmap.each_with_index.select { |item, index| item == true }
	end

	def get_hash(key)
		hash = []
		@k.times do |n|
			hash_function_n(key, n).split('').each_with_index do |item, index|
				hash[index] = true if item == "1"
			end
		end
		return hash
	end

	def hash_function_n(str, n)
		ret_val = 0
		i = 0
		delta = (str.each_byte.first - str.each_byte.first(str.length).last).abs
		reverse = false
		str.each_byte do |b|
			ret_val += (b * n * i)
			ret_val << (delta * 10) + i
			i += 1
		end

		if (n != 0)
			if i % 2 != 0 || n == 1
				ret_val = ret_val << ((@m / n) - ret_val.to_s(2).length).to_i
				reverse = true
			else
				ret_val = ret_val << ((@m / (n * 2)) - ret_val.to_s(2).length).to_i
				reverse = true
			end
		end

		return ret_val.to_s(2).reverse if reverse == true
		return ret_val.to_s(2)
	end

##########################

end