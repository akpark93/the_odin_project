require "spec_helper"

module MasterMind

	describe Game do 

		let (:matt) { Player.new({name: "Matt"}) }
		# let (:andrew) { Player.new({name: "Andrew"}) }

		context "#displays options for colors" do 
			it "displays all the options of colors" do
				game = Game.new(matt)
				expect(game.board.colors) == "Please choose one of the colors: \n #{game.board.colors}"
			end
		end
	end
end