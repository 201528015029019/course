# When done, submit this entire file.

# Part 1

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
  if (j+1 == 0 && n==0)
	result = false
  elsif (j == 0 && n==arr.at(0))
	result = false
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
  result = true
  if s.empty?
	  result = false
  elsif !(s =~/^[a-z]/i)
	  result = false
  elsif s =~ /^[aeiou]/i
	  result = false
  end
  return result
end

def binary_multiple_of_4? s
  if s =~ /^[01]*00$/ || s == '0'
    return true
  else
    return false
  end 
end

# Part 3

class BookInStock

  def initialize(isbn,price)
    if isbn.empty?
      raise ArgumentError.new("isbn error")
    else
      @isbn = isbn
    end

    if price <= 0 
      raise ArgumentError.new("price error")
    else
      @price = price
    end
  end
  
  def isbn
    @isbn
  end

  def price
    @price
  end

  def isbn=(value)
    @isbn = value
  end

  def price=(value)
    @price = value
  end

  def price_as_string
    "$"+format("%0.2f",@price)
  end

end





