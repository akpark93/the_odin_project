# require 'player'
module MasterMind

	class Game

		attr_accessor :board, :player

		def initialize(player,board = Board.new)
			@player = player
			@board = board
		end

		def display_color_options
			puts "Please choose four of the colors separated by commas: \n #{@board.colorList}"
			while true
				answer = gets.chomp.downcase.gsub(/\s+/,"")
				answer_arr = answer.split(",")
				if answer_arr.any? {|color| !colors.include?(color) }
					next
				else
					return answer_arr
				end
			end
		end

		def start_message
			puts "Press 'p' to play, and 'd' for a description"
			answer = gets.chomp
			while (answer != 'p' || answer != 'd') do
				puts "Invalid answer, please choose again"
				answer = gets.chomp
			end
			if answer == 'p'
				return
			else
				description
				puts "Press b to go back"
				back = gets.chomp
				unless (back == 'b')
					start_message
				end
			end
		end

		def description
			#solid description
			puts "Are you a mastermind? Let's find out."
			puts "The goal of the game is to figure out what the opponent has chosen."
			puts "In the beginning, the opponent will choose four colors(can be repeated) and you have ten tries to figure out his code." 
			puts "Each time, you will be given a hint."
			puts "Next to the four chosen colors, there will be an array(block) of four slots"
			puts "If the slot is:"
			puts "'O': one of your choices are correct and in the right position"
			puts "'X': one of your choices are correct but in the wrong position"
			puts "'_': one of your choices are the incorrect color"
			puts "Are you ready to play?"
			puts "Play now!! (y/n)"
			answer = gets.chomp
			until answer == 'y' || answer == 'n'
				answer = gets.chomp
			end
			play if answer == 'y'
			start_message if answer == 'n'
		end

		def game_over_message
			puts "Game Over..."
			puts "Would you like to play again? (y/n)"
			answer = gets.chomp
			while (answer != y || answer != n) do
				puts "Invalid answer, please choose again"
				answer = gets.chomp
			end
			start_message if answer == 'y'
			if answer == 'n'
				puts "Exiting..."
			end
		end

		def win_message
			puts "Congratulations! You win!"
			puts "Would you like to play again? (y/n)"
			answer = gets.chomp
			until answer == 'y' || answer == 'n'
				answer = gets.chomp
			end
			start_message if answer == 'y'
			leave if answer == 'n'
		end

		def leave
			puts "Exiting..."
			exit
		end

		def play
			start_message
			puts "Commencing..."
			puts "Would you like to guess or create? (g/c)"
			answer = gets.chomp
			until answer=='g' || answer=='c'
				puts "Invalid answer. Please choose again. (g/c)"
				answer = gets.chomp
			end
			guess if answer == 'g'
			create if answer == 'c'	
		end

		def guess
			for i in 9.downto(0)
			#display grid
				puts board.grid
				four_chosen_colors = display_color_options
				board.set_row(i,four_chosen_colors)
				if board.winner?(row)
					win_message
					break
				end
			end
			game_over_message
		end

		def create
			puts "Please type four colors separated by commmas to play the comp:"
			puts "Choose from #{board.colorList}"
			answer = gets.chomp
		end

		def get_move(move = gets.chomp)
			# if 
			# end
		end

	end

end

matt = MasterMind::player.new("Matt")
a = MasterMind::Game.new(matt)
a.play