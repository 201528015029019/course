module FunWithStrings
  def palindrome?
    # your code here
	result = false
	if self.length != 0
		s = self.gsub(/[^a-z]/i, '').downcase 
		if (s.reverse.eql?(s))
			result = true
		end
	end
	return result
  end
  def count_words
    # your code here
	array = self.gsub(/[^a-z]/i,' ').downcase.split(/\s+/)
	hash = Hash.new(0)
	array.each{ |w| hash[w] += 1 unless w.empty?}
	return hash
  end
  def anagram_groups
    # your code here
	hash = Hash.new
	group = []
	self.gsub(/[^a-z]/i,' ').split(/\s+/ ).each{ 
	|e| word = e.downcase.chars.sort.join
	if hash[word].nil?
		hash[word] = [e]
	else
		hash[word] << e
	end
	}
	hash.each_value{|w| group << w}
	return group
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
