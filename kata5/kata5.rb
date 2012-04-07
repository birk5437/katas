#m = size of bitmap 
#k = # of hash functions
#n = elements in wordlist

require 'BloomFilter.rb'

def main
	bf = BloomFilter.new(100000, 6)

	word_count = 0
	File.open("/usr/share/dict/words").each_line do |word|
		bf.add_key(word)
		word_count += 1
		puts word_count.to_s if word_count % 100 == 0
		break if word_count % 1000 == 0
	end

	puts "Added #{word_count.to_s} words."
	puts "Bitmaps used: #{bf.bitmap.select { |i| i == true }.count} of #{bf.bitmap.length}"

	puts bf.has_key?("abcdefghhhhhhhhhhhhhhhhhhhhhhhh    ")

	#bf.add_key("Burke")
	#puts bf.get_hashes("Burke")
	#puts bf.has_key?("Burke")
	#puts bf.bitmap

end




main

#bitArr = []
#50.times do
#  bitArr.push(0)
#end




