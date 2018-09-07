def range(start, ende)
  last = ende - 1
  return [] if last < start
  range(start, last) + [last]
end


def rec_sum(arr)
  return arr[0] if arr.length == 1
  arr[0] + rec_sum(arr[1..-1])
end

def expo(b, n)
  return 1 if n < 1
  b * expo(b, n-1)
end

def expo2(b, n)
  return 1 if n==0
  return b if n==1
  if n.even?
    expo2(b,n/2)**2
  else
    b*expo2(b,(n-1)/2)**2
  end
end

def deep_dup(arr)
  result = []
  arr.each do |el|
    if el.is_a?(Array)
      result << deep_dup(el)
    else
      result << el
    end
  end
  result
end

def fibonacci(n)
  result=[1,1]
  return result[0] if n==1
  until result.length==n
    result<< result[-1]+result[-2]
  end
  result

end


def rec_fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  prev_fib = rec_fib(n-1)
  prev_fib + [prev_fib[-2] + prev_fib[-1]]
end

def bsearch(arr,target)
  p arr
  mid = arr.length / 2

  return mid if arr[mid] == target

  if arr[mid] < target
    bigarr = arr[mid..-1]
    mid + bsearch(bigarr,target)
  else
    small = arr[0...mid]
    bsearch(small, target)
  end

end

def merge_sort(arr)
  p "I am array when merge called: #{arr}"
  return arr if arr.length <= 1
  mid = arr.length / 2

  left_arr = arr[0...mid]
  right_arr = arr[mid..-1]

  merge(merge_sort(left_arr) ,merge_sort(right_arr))
end

def merge(arr, arr2)
  p "merge invoked! arr1: #{arr} arr2#{arr2}:"
  result = []
  until arr.empty? || arr2.empty?

    if arr[0] < arr2[0]
    result << arr.shift
  else
    result << arr2.shift
  end
  end
  result + arr + arr2
end

# def merge(arr)
#   p "Here is array 1 #{arr}, Array 2 #{arr2}"
#   if arr[0]> arr2[0]
#     return p [arr2[0],arr[0]]
#   else
#     return p [arr[0],arr2[0]]
#   end
#     if arr.first> arr.last
#       arr[0],arr[1]=arr[1],arr[0]
#       arr
#     else
#       arr
#     end
#
# end

#
