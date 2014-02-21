# def split_num(num, value)
#   whole = (num/value) * value #gives num w/o remainder
# end

# def take_away(num, value)
#   num -= split_num(num, value)
# end

# def num_array(num)
#   num_list = []

#   places = [1000, 100, 10, 1]

#   for place in places
#     if num >= place
#       num_list << split_num(num, place) # ===> returns updated number
#       num = take_away(num, place)
#     end
#   end
#   print num_list
# end

# puts num_array(9077)


def split_num(num, value)
  whole = num/value
end

def take_away(num, value)
  num -= split_num(num,value)
end

def zeroes(num)
  places = num.to_s.length
  number_array = [1, 2, 3, 4, 5]

  for number in number_array
    if number == places
      print split_num(num, value).to_s + ("0"*(number-1))




  if places == 0
    print "no Number given"

  elsif places == 1
    print num.to_s + "" #if num length == 1 then length - 1 "0"
  elsif places == 2
    whole = num/10
    print whole.to_s + ("0"*(places-1)) #if num length == 2 then num of "0" == length - 1
  elsif places == 3
    whole = num/100
    print whole.to_s + ("0"*(places-1))
  elsif places == 4
    whole = num/1000
    print whole.to_s + ("0"*(places-1))

  elsif places == 5
    whole = num/10000
    print whole.to_s + ("0"*(places-1))
  elsif places == 6
    whole = num/100000
    print whole.to_s + ("0"*(places-1))
  elsif places > 6
    print num.to_s + "Many zeros"
  end
end
puts zeroes(6009)

# #Find length of number
# #length - 1 is equal to number of zeros
# #length - 1 is also how you access the last digit
# #
# #iterate through number

