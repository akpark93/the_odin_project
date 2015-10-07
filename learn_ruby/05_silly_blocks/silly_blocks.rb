def reverser(&block)

	str = block.call
	words = str.split(" ")
	words.map! {|word| word.reverse}
	words.join(" ")

end

def adder(num=1,&block)

	block.call + num

end

def repeater(num=1,&block)

	num.times {|time| block.call}

end
