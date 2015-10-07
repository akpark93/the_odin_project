class Book

	attr_accessor :title

	def title
		@title.split(' ').map {|word|
			word.capitalize
		}.join(' ')
	end 


end

@book = Book.new
@book.title = "stuart little"
puts @book.title