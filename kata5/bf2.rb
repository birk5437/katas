class Bf2

	attr_accessor :bitmap

	def initialize(mval, k)
		@m = mval
		@k = k
		@bitmap = []
	end

	def add_key(key)
		@k.times do |hash_number|
			index = self.hash_n(key, hash_number)
			puts "adding #{key} at index #{index}"
			@bitmap[index] = true
			#@bitmap.insert(self.hash_n(key, hash_number), 1)
		end
	end

	def read_file(lines = 1000)
		filename = "/usr/share/dict/words"
		word_count = 0
		File.open(filename).each_line do |word|
			self.add_key(word.chomp)
			word_count += 1
			puts word_count.to_s if word_count % 100 == 0
			break if word_count % lines == 0
		end
	end

	def has_key?(key)
		@k.times do |hash_number|
			puts "#{hash_number.to_s} : bitmap[#{self.hash_n(key, hash_number)}] = #{@bitmap[self.hash_n(key, hash_number)]}"
			return false unless @bitmap[self.hash_n(key, hash_number)] == true
		end
		return true
	end

	def true_bits
		@bitmap.each_with_index.select { |item, index| item == true }
	end	

	def get_hash(key)
		arr = []
		@k.times do |hash_number|
			arr[self.hash_n(key, hash_number)] = true
		end

		return arr
	end

	def hash_n(str, n)

		delta = str.each_byte.first - str.each_byte.first(str.length).last
		n = n.abs + 1
		my_hash = str.hash + n

		my_hash += delta

		while ((my_hash.abs / n) + n) > @m do
			my_hash = my_hash << -1
			my_hash += delta
		end


		my_answer = (my_hash / n) + n
		return my_answer if my_hash >= 0
		return @m + my_answer
	end

end