require 'kata2_iterative.rb'

describe ChopIter do
	it "binary searches an array" do
		chopIter = ChopIter.new
		numbers = [1, 3, 5, 7]
		key = 8
		chopIter.chop(key, numbers).should eq(-1)
	end
end
