require "spec_helper"

module MasterMind

	describe Board do 

		context "#displays_board" do
			# it "displays the board properly" do
			# 	board = Board.new
			# 	expect(board.display_board) == board.display_board
			# end

			it "displays board after input" do
				board = Board.new
				puts board.four_blocks
				chosen_colors = ["red","green","blue","orange"]
				board.set_row(1,chosen_colors)
				board.display_board
				puts board.four_blocks
			end
		end

		context "#random_generation" do 
			it "displays the random generated colors" do
				board = Board.new
				expect(board.four_blocks) == board.four_blocks
				puts board.four_blocks
			end
		end

		context "#check_row" do
			it "checks the row" do
				board = Board.new
				print board.four_blocks
				chosen_colors = ["red","green","blue","orange"]
				board.set_row(1,chosen_colors)
				puts board.four_blocks
				puts board.check_row(1)
			end
		end

	end

end