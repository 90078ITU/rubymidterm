def squared_sum(a, b)
	total = a + b
	total = total * total
	return total
end

squared_sum 3, 3


def sort_array_plus_one(a)
	sortedArr = a.sort
	sortedArr = sortedArr.collect{|x| x+1}
	return sortedArr
end


sort_array_plus_one [13,21,5,41,7]


def combine_name (first_name, last_name)
	return first_name + " " + last_name
end

puts combine_name "Ercan", "Gursoy"