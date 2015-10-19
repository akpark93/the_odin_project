class Board

	attr_reader :grid


	def default_grid
		grid = Array.new(3) {Array.new(3) {Cell.new}}
	end
end