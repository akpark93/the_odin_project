class Hangman

	def initialize
		@word = randomWord.split("")
		@current_word = Array.new(@word.length, "_")
		@turns_remaining = 8
		@incorrect_letters = []
	end

	def introduction
		puts ""
		puts "Welcome to Hangman!"
		puts "The goal of the game is to guess the random word."
		puts "You have a total of 8 guesses."
		puts "Begin!"
		puts ""
	end

	def winner?
		true if @current_word.join("") == @word
	end

	def game_over?
		true if @turns_remaining == 0
	end

	def game_over
		border
		puts "Game Over..."
		puts "Sorry, you lose."
		puts "The correct word was #{@word.join}"
		puts "Would you like to play again? (y/n)"
		start_over
	end

	def congratulations
		border
		puts "Congratulations! You win!"
		puts "Would you like to play again? (y/n)"
		start_over
	end

	def start_over
		answer = gets.chomp.downcase
		while true 
			if answer == 'y'
				initialize
				play
			elsif answer == 'n'
				puts "Thank you for playing"
				puts "Exiting..."
				exit
			else
				puts "Invalid answer. Please type again."
			end
		end
	end

	def play
		introduction
		letter = ""
		while true
			display_status
			if winner?
				congratulations
				break
			end
			if game_over?
				game_over
				break
			end
			display_incorrect_letters
			letter = get_letter_input
			border
		end
	end

	def get_letter_input
		puts "Please input 'one' letter"
		answer = gets.chomp.downcase
		if answer.length > 1 || answer.match(/[^a-z]/)
			puts "Invalid answer. Please type again"
			get_letter_input
		end
		change_status(answer)
	end

	def change_status(answer)
		if !@word.include?(answer)
			@turns_remaining -= 1
			@incorrect_letters << answer
		elsif @current_word.include?(answer)
			puts "Letter already used!"
			get_letter_input
		else
			@word.each_with_index do |l,i|
				@current_word[i] = answer if @word[i] == answer
			end
		end
	end

	def display_status
		puts "#{@current_word} . \nYou have #{@turns_remaining} turn(s) remaining."
	end

	def border
		puts "--------------------------------------------------"
	end

	def display_incorrect_letters
		puts "Incorrect letters used thus far: #{@incorrect_letters}"
	end

	def randomWord
		words = []
		File.readlines("5desk.txt").map do |line|
			line.scan(/\w+/) do |word|
				words.push(word.downcase) if word.length > 5 && word.length < 12
			end
		end
		words.sample
	end

end


hangman = Hangman.new
hangman.play