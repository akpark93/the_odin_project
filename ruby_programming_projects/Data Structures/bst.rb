class Node

	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value=nil, parent=nil, left_child=nil, right_child=nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end

	def value
		@value
	end

	def value=(new_value)
		@value = new_value
	end

	def parent
		@parent
	end

	def parent=(new_parent)
		@parent = new_parent
	end

	def left_child
		@left_child
	end

	def left_child=(new_left_child)
		@left_child = new_left_child
	end

	def right_child
		@right_child
	end

	def right_child=(new_right_child)
		@right_child = new_right_child
	end

	def to_s
		@value != nil ? val = @value : val = '_'
		@left_child != nil ? left = @left_child.value : left = '_'
		@right_child != nil ? right = @right_child.value : right = '_'
		@parent != nil ? parent = @parent.value : parent = '_'

		puts "value: #{val}, left: #{left}, right: #{right}, parent: #{parent}"
	end
end


class BinarySearchTree

	attr_accessor :root, :tree, :array

	def initialize(array=nil, root=nil, tree=nil)
		@array = merge_sort(array)
		@tree = build_tree
	end

	def build_tree(left = 0, right = @array.length-1, parent=nil)

		return if left > right

		index_mid = left + (right-left)/2
		node = Node.new(@array[index_mid])

		node.left_child = build_tree(left, index_mid-1, node)
		node.right_child = build_tree(index_mid+1, right, node)

		node.parent = parent
		node

	end

	def breadth_first_search(value)
		queue = [@tree]
		while queue
			node = queue.shift
			if node.value == value
				return node
			end
			queue.push(node.left_child) if node.left_child
			queue.push(node.right_child) if node.right_child
		end
		return nil
	end

	def depth_first_search(value)
		stack = [@tree]
		while stack
			node = stack.pop
			if node.value == value
				return node
			end
			stack.push(node.right_child) if node.right_child
			stack.push(node.left_child) if node.left_child
		end
		return nil
	end

	def dfs_rec(value, node=@tree)
		return nil if node.nil?
		return node if node.value = value

		dfs_rec(value, node.left_child)
		dfs_rec(value, node.right_child)

	end

	def merge_sort(arr)

		if arr.length <= 1
			return arr
		end

		length = arr.length/2

		left = merge_sort(arr[0...length])
		right = merge_sort(arr[length..-1])

		merge(left,right)

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

	def display_tree

		puts "Binary Search Tree"
		list = [@tree]
		until list.empty?
			node = list.shift
			list << node.left_child if node.left_child != nil
			list << node.right_child if node.right_child != nil
			puts node.to_s
		end

	end

end

# bst = BinarySearchTree.new([1,7,4,23,8])
# puts bst.display_tree
# puts bst.depth_first_search(1).to_s
# puts bst.breadth_first_search(23).to_s
# puts bst.dfs_rec(23).to_s
