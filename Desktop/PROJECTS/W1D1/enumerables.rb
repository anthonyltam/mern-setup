require 'byebug'


class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      result << el unless prc.call(el)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    # debugger
    # p self
    result = self.dup
    p result
    if result.none? { |el| el.is_a?(Array) }
      return result
    else
      i = 0
      while i < result.length
        if result[i].is_a?(Array)
          sub_result = result[i]
          result = result[0...i] + sub_result + result[(i + 1)..-1]
        end
        i += 1
      end
      # return result.my_flatten
    end
    return result.my_flatten
  end


  def my_zip(*arg)
    result = []

    i = 0
    while i < self.length
      sub_arr = []
      sub_arr << self[i]
      arg.each do |arr|
        sub_arr << arr[i]
      end
      i+=1
      result << sub_arr

    end
    result
  end


  def my_rotate(rotation = 1)
    array = self.dup
    if rotation > array.length
      rotation = rotation % array.length
    end
    while rotation < 0
      rotation = rotation + array.length
    end

    taken = array.take(rotation)
    array = array.drop(rotation) + taken
  end

  def my_join(separator='')
    result = ''
    self.map.with_index do |char, idx|
      unless idx == self.length - 1
        result += char + separator
      else
        result += char
      end
    end
    result
  end

  def my_reverse
    i = self.length-1
    result = []

    while i >= 0
      result << self[i]
      i -= 1
    end
    result

  end

  def factors(num)
    (1..num).select {|el| num % el == 0}
  end

  def bubble_sort!(&prc)

    sorted = false
    while !sorted
      sorted = true
      # iterate through array indexes
      self.each_index do |i|
        if prc.call(self[i], self[i + 1]) == 1
          sorted = false
          self[i], self[i + 1] = self[i + 1], self[i]
        end
      end
    end
    self

  end

  def bubble_sort(&prc)
    result = self.dup
    result.bubble_sort(&prc)
  end

end

class String

  def substrings
    result = []
    i = 0


    while i < self.length
      j = 0
      while j < self.length
        # next if j < i
        result << self[i..j]
        j += 1
      end
      i += 1
    end
    result
  end

  def subwords(dictionary)
    possible_words = self.substrings
    # dictionary.select {|word| word.include?(possible_words)}

    dictionary.select {|correct_word| possible_words.include?(correct_word)}
  end

end




# end
