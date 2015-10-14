def caesar_cipher(str, num)

	result = str.split("")
	result.map! do |char|
		if char == ' '
			' '
		else
			if ('A'..'Z').include?(char)
				((char.ord+num-90)%26+64).chr
			elsif ('a'..'z').include?(char)
				((char.ord+num-122)%26+96).chr
			end 
		end
	end
	result.join("")

end

