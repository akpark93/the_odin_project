def bubble_sort(arr)

	sorted = false
	until sorted
		sorted = true
		(arr.length).times do
			for i in 0...arr.length-1
				if arr[i]>arr[i+1]
					sorted = false
					arr[i],arr[i+1] = arr[i+1],arr[i]
				end
			end
		end
	end
	arr

end

# puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr)

	sorted = false
	until sorted
		sorted = true
		(arr.length).times do
			for i in 0...arr.length-1
				if yield(arr[i], arr[i+1]) > 0
					sorted = false
					arr[i],arr[i+1] = arr[i+1],arr[i]
				end
			end
		end
	end
	arr
end

# puts bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length - right.length }