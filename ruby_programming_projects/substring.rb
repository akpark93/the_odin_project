def substrings(str, arr)

	str.downcase!
	result = Hash.new(0)
	words = str.split(" ")
	words.each do |word| 
		arr.each do |dictionary_word|
			result[dictionary_word] += 1 if word.include?(dictionary_word)
		end
	end
	result

end
