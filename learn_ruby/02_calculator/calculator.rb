def add(num1, num2)

	num1 + num2

end

def subtract(num1, num2)

	num1 - num2

end

def sum(arr)

	sum = 0
	arr.each {|i| sum += i}
	sum

end

def multiply(num1, num2)

	num1*num2

end

def power(num1, power)

	num1**power

end

def factorial(num)

	fact = 1
	for i in 1..num
		fact *= i
	end
	fact

end