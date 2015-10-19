module MasterMind

	class Board

		attr_accessor :grid
		attr_reader :colors, :four_blocks
		$colors = ["red","green","blue","yellow","brown","orange","black","white"]

		def initialize(grid = defaultGrid, four_blocks = random_generation)
			@grid = grid
			@four_blocks = four_blocks
		end

		def set_block(row, column, color)
			@grid[row,column-1] = color
		end

		def get_block(row, column)
			@grid[row,column-1]
		end

		def set_row(row, color_array)
			for i in 0...color_array.length
				@grid[row][i] = color_array[i]
			end
			add_hint(row)
		end

		def display_board
			grid.each {|row| p row }
		end

		def add_hint(row)
			hint = check_row(row)
			@grid[row][4] = hint
		end

		def check_row(row)
			result = []
			clone = four_blocks.clone
			for i in 0...4
				if grid[row][i] == four_blocks[i]
					result << 'O'
					clone[i] = ''
				end
			end
			for i in 0...4
				if clone.include?(grid[row][i])
					result << 'X'
					clone[i] = ''
				end
			end
			for i in 0...4
				if result[i] == nil
					result << '_'
				end
			end
			return result
		end

		def winner?(row)
			return true if grid[row][4].all? {|n| n == 'O'}
		end

		# def game_over
		# 	return true if 
		# end

		#when playing AI
		def random_generation
			4.times.map {$colors.sample}
		end

		private

		def defaultGrid
			Array.new(10) {Array.new(5)}
		end

	end

end