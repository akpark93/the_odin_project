class Book

	attr_accessor :title

	def title
		little_words = ['the','or','of','and','in','a','an']
		words = @title.split(' ').each { |i|
			i.capitalize! unless little_words.include?(i)
		}
		words[0].capitalize!
		words.join(' ')
	end 

end