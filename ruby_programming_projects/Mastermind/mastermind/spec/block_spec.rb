require "spec_helper"

module MasterMind

	describe Block do 

		context "#initialize" do 
			it "is initialized with a color of '' by default" do
				block = Block.new
				expect(block.color) == ''
			end
		end

	end

end