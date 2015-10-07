def echo(str)
	str
end

def shout(str)
	str.upcase
end

def repeat(str,count=2)
	([str] * count).join(" ")
end

def start_of_word(str, num)
	str[0...num]
end

def first_word(str)
	str.split(" ")[0]
end

def titleize(str)
	words_to_ignore = ['and','the','of', 'over']
	str_arr = str.split(' ').each { |i| 
		i.capitalize! unless words_to_ignore.include?(i)
	}
	str_arr[0].capitalize!
	str_arr.join(' ')
end