def merge_sort(arr)

	if arr.length <= 1
		return arr
	end

	length = arr.length/2

	left = merge_sort(arr[0...length])
	right = merge_sort(arr[length..-1])

	merge(left, right)

end

def merge(left, right)

	sorted_arr = []
	until (left.empty?) || (right.empty?)
		if left[0] < right[0]
			sorted_arr << left.shift
		else
			sorted_arr << right.shift
		end
	end
	sorted_arr += left 
	sorted_arr += right 
	sorted_arr

end

puts merge_sort([1,4,7,3,2,1,45,6])