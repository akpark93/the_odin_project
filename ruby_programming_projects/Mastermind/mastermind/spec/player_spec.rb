require "spec_helper"

module MasterMind

	describe Player do 

		context "#initialize" do
			it "initializes with name default ''" do
				player = Player.new
				expect(player.name) == ''
			end
		end

	end

end