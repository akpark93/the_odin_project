def translate(str) 

	words = str.split(" ")
	words.map! {|word|  
		piglatin(word)
	}

	words.join(" ")

end

def piglatin(word)

	vowels = ['a','e','i','o','u']

	letters = word.split("")
	count = 0
	for i in 0..letters.length
		letter = letters[i]
		if letters[i] == 'q' && letters[i+1] == 'u'
			letters << 'qu'
			count += 2
			break
		end
		break if vowels.include?(letter)
		letters << letter
		count += 1
	end

	count.times {|i| letters.shift}
	letters << "ay"
	letters.join("")

end