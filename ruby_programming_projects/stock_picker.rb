def stock_picker(arr)
	max = 0
	max_coordinates = []
	for i in 0...arr.length
		first_price = arr[i]
		for j in i...arr.length
			second_price = arr[j]
			if (second_price - first_price) > max
				max = second_price - first_price
				max_coordinates = [i,j]
			end
		end
	end
	max_coordinates
end

