def fibs(n)

	first = 0
	sec = 1
	for i in 2..n
		next_num = first + sec
		first = sec
		sec = next_num
	end
	sec

end

def fibs_rec(n)

	return 1 if n<=2
	return fibs_rec(n-1) + fibs_rec(n-2)

end

puts fibs(10)
puts fibs_rec(23)