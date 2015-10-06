# When done, submit this entire file.

#Author: Seventeen
#Date: 2015/9/26

# Part 1

include Enumerable

def sum arr
  sum_of_arr = 0
  for i in arr
	sum_of_arr += i
	end
  return sum_of_arr	
end

def max_2_sum arr
  sum_of_max_2 = 0
  size_of_arr = arr.size
  if size_of_arr == 1
    sum_of_max_2 = arr.at(0)
  elsif size_of_arr > 1
    sort_arr = arr.sort.reverse!
    sum_of_max_2 = sort_arr.at(0)+sort_arr.at(1) 
  end
  return sum_of_max_2
end

def sum_to_n? arr, n
  result = false
  sort_arr = arr.sort
  j = arr.size-1
  i = 0
  if (j+1 == 0 && n==0)||(j == 0 && n==arr.at(0))
	result = true
  else
	while i < j
		if sort_arr.at(i)+ sort_arr.at(j) < n
			i += 1
		elsif sort_arr.at(i)+ sort_arr.at(j) > n
			j -= 1
		else
			result = true
			break
		end
	end
  end
  return result
end

# Part 2

def hello(name)
  return "Hello, #{name}"
end

def starts_with_consonant? s
  if s =~ /^[aeiou]/i
	return true
  else
    return false
  end
end

def binary_multiple_of_4? s
  if s =~ /^[01]*00$/
    return true
  else
    return false
  end 
end

# Part 3

class BookInStock
  # YOUR CODE HERE
  def initialize(isbn, price)
	@book_isbn = isbn
	@book_price = price
  end
  def price_as_string()
	return "\$%.2f" % @book_price
  end
end

