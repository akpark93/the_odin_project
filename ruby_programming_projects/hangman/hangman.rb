#randomly select a word 5-12 letters long

class Hangman

	def initialize
		@word = randomWord
		@current_word = Array.new(@word.length, "_")
		@turns_remaining = 9
	end

	def introduction
		puts "Welcome to Hangman!"
		puts "The goal of the game is to guess the word."
		puts "You have eight guesses."
		puts "Begin!"
	end

	def winner?
		true if @current_word.join("") == @word
	end

	def game_over?
		true if @turns_remaining == 0
	end

	def game_over
		puts "Sorry, you lose."
		puts "Would you like to play again? (y/n)"
		start_over
	end

	def congratulations
		puts "Congratulations! You win!"
		puts "Would you like to play again? (y/n)"
		start_over
	end

	def start_over
		answer = gets.chomp
		if answer == 'y'
			initialize
			play
		end
	end

	def play
		introduction
		letter = ""
		while true
			display_status(letter)
			if winner?
				congratulations
				break
			end
			if game_over?
				game_over
				break
			end
			letter = get_letter_input
		end
	end

	def get_letter_input
		puts "Please input 'one' letter"
		answer = gets.chomp
		if answer.length > 1
			puts "Answer too long! One letter!"
		end
		answer
	end

	def display_status(letter)
		puts "word : #{@word}"
		word_array = @word.split("")
		if !word_array.include?(letter) || @current_word.include?(letter)
			@turns_remaining -= 1
		end
		word_array.each_with_index do |l,i|
			@current_word[i] = letter if word_array[i] == letter
		end
		puts "#{@current_word} . You have #{@turns_remaining} turns remaining."
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