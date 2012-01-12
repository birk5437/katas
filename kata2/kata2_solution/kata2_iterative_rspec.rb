require 'kata2_iterative.rb'

describe ChopIter do
	for i in -1000..1000
	
		it "binary searches an array" do
			chopIter = ChopIter.new

			chopIter.chop(3, []).should eq(-1)
			chopIter.chop(3, [1]).should eq(-1)
			chopIter.chop(1, [1]).should eq(0)
			 # 
			chopIter.chop(1, [1, 3, 5]).should eq(0)
			chopIter.chop(3, [1, 3, 5]).should eq(1)
			chopIter.chop(5, [1, 3, 5]).should eq(2)
			chopIter.chop(0, [1, 3, 5]).should eq(-1)
			chopIter.chop(2, [1, 3, 5]).should eq(-1)
			chopIter.chop(4, [1, 3, 5]).should eq(-1)
			chopIter.chop(6, [1, 3, 5]).should eq(-1)
			 # 
			chopIter.chop(1, [1, 3, 5, 7]).should eq(0)
			chopIter.chop(3, [1, 3, 5, 7]).should eq(1)
			chopIter.chop(5, [1, 3, 5, 7]).should eq(2)
			chopIter.chop(7, [1, 3, 5, 7]).should eq(3)
			chopIter.chop(0, [1, 3, 5, 7]).should eq(-1)
			chopIter.chop(2, [1, 3, 5, 7]).should eq(-1)
			chopIter.chop(4, [1, 3, 5, 7]).should eq(-1)
			chopIter.chop(6, [1, 3, 5, 7]).should eq(-1)
			chopIter.chop(8, [1, 3, 5, 7]).should eq(-1)
			chopIter.chop(8, [1, 3, 5, 7, 7]).should eq(-1)
			chopIter.chop(18, [1, 3, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]).should eq(-1)

		
			chopIter.chop(i, Array(0..i)).should eq(i)
			chopIter.chop(-i, Array(0..i)).should eq(-1)
		end
	end
end
