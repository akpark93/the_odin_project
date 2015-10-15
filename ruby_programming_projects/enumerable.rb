module Enumerable

	def my_each 
		return self.to_enum if !block_given?
		for i in self
			yield(i)
		end
	end

	def my_each_with_index 
		return self.to_enum if !block_given?
		idx = 0
		self.my_each {|i| 
			yield i,idx 
			idx += 1
		}
	end

	def my_select 
		return self.to_enum if !block_given?
		copy = []
		self.my_each {|i| copy << i if yield i}
		copy
	end

	def my_all? 
		self.my_each {|i| return false unless yield i}
	end

	def my_any? 
		self.my_each {|i| return true if yield i}
	end

	def my_none?
		self.my_each {|i| return false if yield i}
		return true
	end

	def my_count 
		return self.to_enum if !block_given?
		count = 0
		if block_given?
			self.my_each {|i| count += 1 if yield i}
		else
			self.my_each {|i| count += 1}
		end
		count
	end

	def my_map(&proc)
		return self.to_enum if !block_given?
		new_array = []
		self.my_each do |i|
			new_array << proc.call(i)
		end
		new_array
	end

	def my_inject(accum = self[0])
		self.unshift(self[0]) unless accum == self[0]
		for i in 0...self.size
			accum = yield(accum, self[i])
		end
		accum
	end

	def multiply_els
		self.my_inject { |result,element| result * element }
	end
end


# @a = ["a","bit city life","c","hold on tight","e","zzzz","hit me up"]
# a = ["a","bit city life","c","hold on tight","e","zzzz","hit me up"]

# @b = ["aaaaa","yoooo"]
# @n = [1,2,3,4,5,6,7,8,9,10]
# @b = {a: "bit city life",c: "hold on tight",p: "piratess"}

# @a.my_each {|a| puts "#{a}"}
# arr = @n.my_select {|num| num.even? }
# puts arr
# @n.my_any? {|a| a.even?} #true
# @n.my_none? {|a| a.even?} #false
# @a.my_count {|a| puts a}
# puts @a.my_map {|a| a * 3}
# puts a.map {|a| a *3}
# puts @n.my_inject {|n,m| n+m}
# @a.my_inject {|a,n| a += n }
# @a.my_each_with_index {|a,i| puts "#{i} : #{a}"}
# puts [4,2,1,3].my_inject(1) { |result, element| result + element }
# puts [2,4,5].multiply_els
# puts @a.my_all? { a.length >= 3 }
# puts @b.my_all? {|a| a.length >= 3}
