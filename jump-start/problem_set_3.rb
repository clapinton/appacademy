require 'byebug'

# ***********************************
# Write a method that takes an array of numbers as input and uses #select to return an array only of even numbers

def get_evens(array)
  array.select do |num|
    num%2==0
  end
end

# puts "\nGet evens:\n" + "*" * 15 + "\n"
# puts get_evens([1, 2, 3, 4, 5, 6, 7]) == [2, 4, 6]
# puts get_evens([2, 4, 6, 8, 10, 12, 14]) == [2, 4, 6, 8, 10, 12, 14]
# puts get_evens([1, 3, 5, 7, 9, 11]) == []

# ***********************************
# Write a method that takes an array of numbers as input and uses #reject to return an array of number that aren't odd

def reject_odds(array)
  array.reject do |num|
    num%2 != 0
  end
end

# puts "\nReject odds:\n" + "*" * 15 + "\n"
# puts reject_odds([1, 2, 3, 4, 5]) == [2, 4]
# puts reject_odds([2, 4, 6, 8, 10]) == [2, 4, 6, 8, 10]
# #puts reject_odds([1.1, 3.5, 2.9]) == [1.1, 3.5, 2.9]

# ************************************
# Write a method that uses #reduce to sum up the numbers in an array

def array_sum(array)
  return 0 if array.empty?
  array.reduce do |sum,num|
    sum+=num
  end
end

# puts "\nArray sum:\n" + "*" * 15 + "\n"
# puts array_sum([]) == 0
# puts array_sum([1, 2, 3]) == 6
# puts array_sum([5, 5, 5, 5, 5]) == 25

# ************************************
# Write a method that takes an array of integers and returns an array of those values doubled.
# This method should *not* modify the original array

def calculate_doubles(array)
  array.map do |num|
    num*2
  end
end

# puts "\nCalculate doubles:\n" + "*" * 15 + "\n"
# array = [1, 2, 3, 4, 5]
# doubled_array = calculate_doubles(array)
# puts array != doubled_array
# puts doubled_array == [2, 4, 6, 8, 10]

# ************************************
# Write a method that takes an array of integers and returns an array of those values doubled.
# This method *should* modify the original array

def calculate_doubles!(array)
  array.map! do |num|
    num*2
  end
end

# puts "\nCalculate doubles!:\n" + "*" * 15 + "\n"
# array = [1, 2, 3, 4, 5]
# calculate_doubles!(array)
# puts array == [2, 4, 6, 8, 10]

# ************************************
# Write a method that takes an array of numbers as input and returns the sum of each element multiplied by its index.
# For example, [2, 9, 7] would return 23, since (2 * 0) + (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23

def array_sum_with_index(array)
  sum_array = 0
  array.each_with_index do |num,idx|
    sum_array += num*idx
  end
  sum_array
end

# puts "\nArray sum with index:\n" + "*" * 15 + "\n"
# puts array_sum_with_index([0, 1, 2, 3]) == 14
# puts array_sum_with_index([2, 9, 7]) == 23

# ************************************
# Write a method that uses sort to implement the max function.  Your method should take an array as input and return
# the element with the maximum value, calling sort once.

def my_max(array)
  sorted_array = array.sort
  sorted_array[-1]
end

# puts "\nMy max:\n" + "*" * 15 + "\n"
# puts my_max([5, 9, 2, 4, 7]) == 9
# puts my_max([1, 4, 9, 19, 3]) == 19

# ************************************
# Write a method that uses sort to implement the min function.  Your method should take an array as input and return
# the element with the minimum value, calling sort once.

def my_min(array)
  sorted_array = array.sort
  sorted_array[0]
end

# puts "\nMy min:\n" + "*" * 15 + "\n"
# puts my_min([5, 9, 2, 4, 7]) == 2
# puts my_min([0, -2, -5, -5, 1]) == -5

# ************************************
# Write a method that returns the third greatest element in an array

def third_greatest(array)
  sorted_array = array.sort
  sorted_array[-3]
end

# puts "\nThird greatest:\n" + "*" * 15 + "\n"
# puts third_greatest([5, 9, 3, 7, 7, 2, 10]) == 7

# ************************************
# Write a method that takes a string of words separated by spaces and returns the longest word.  If there is more
# than one word of that length, it should return the first instance of that word.

def longest_word(string)
  words = string.split(" ")
  words.max_by do |word|
    word.length
  end
end

# puts "\nLongest word:\n" + "*" * 15 + "\n"
# puts longest_word("we the people in order to form a more perfect union establish justice ensure domestic tranquility") == "tranquility"
# puts longest_word("one two three four five six seven") == "three"

# ************************************
# Write a method that takes a string and counts the number of vowels in the string.  For our purposes, "y" counts as a vowel.
# You might want to use the Array#include? method for this.  The usage is:
# [1, 2, 3, 4, 5].include?(2) => true
# [1, 2, 3, 4, 5].include?("k") => false
# Assume all letters will be lower case

def count_vowels(string)
  vowels = ['a','e','i','o','u','y']
  chars = string.split("")
  chars.count do |char|
    vowels.include?(char)
  end
end

# puts "\nCount vowels:\n" + "*" * 15 + "\n"
# puts count_vowels("cat dog elephant monkey") == 8
# puts count_vowels("abcdefghijklmnopqrstuvwxyz") == 6

# ************************************
# Write a method that takes a string of words separated by spaces and returns a string the same as the original, but
# with five-letter words replaced with "#####"

def redact_five_letter_words(string)
  words=string.split
  words.map! do |word|
    word = word.length == 5 ? "#####" : word
  end
  words.join(" ")
end

# puts "\nRedact five letter words:\n" + "*" * 15 + "\n"
# puts redact_five_letter_words("one two three four five six seven eight") == "one two ##### four five six ##### #####"
# puts redact_five_letter_words("we the people in order to form a more perfect union establish justice ensure domestic tranquility") == "we the people in ##### to form a more perfect ##### establish justice ensure domestic tranquility"

# ************************************
# Write a method that takes a string of words separated by spaces and returns the most common vowel.  If more than one vowel has that count,
# return the one that occurs earliest in the alphabet.  For our purposes, count "y" as a vowel.
# Assume all letters are lower case.

def most_common_vowel(string)
#vowels = [a,e,i,o,u,y]
#split into chars
#hash_chars('a' ==> 0, 'e' ==> 0... 'y' ==>)
#chars.each |char| hash_chars[char] += 1 if vowels.include?(char), so that only vowels get to the hash
#hash_chars.each_key do |char| return char if hash_chars[char] = hash_chars.values.max
#hash_chars.value.max will return the greatest val. Since we're doing each_key on the hash, we're walking the key forward. Since the keys are sorted, the first one that matches the condition gets returned, even if a later one would also match

  vowels = ['a','e','i','o','u','y']
  chars = string.split("").select do |char|
    vowels.include?(char)
  end
  hash_chars  = Hash.new(0)
  chars.each do |char|
    hash_chars[char] += 1
  end
  hash_chars.each_key do |char|
    #hash_chars.value.max will return the greatest val. Since we're doing each_key on the hash, we're walking the key forward. Since the keys are sorted, the first one that matches the condition gets returned, even if a later one would also match
    return char if hash_chars[char] == hash_chars.values.max
  end
end

# puts "\nMost common vowel:\n" + "*" * 15 + "\n"
# puts most_common_vowel("we the people in order to form a more perfect union establish justice ensure domestic tranquility") == "e"
# puts most_common_vowel("cat dog octopus spider") == "o"
