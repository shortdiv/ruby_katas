require 'pry'
#convert a number into words

# def wordify(num)
# 	string = ""
# 	if num == 0
# 		string << "Zero"
# 	end

# 	if num > 1000
# 		whole = num/1000
# 		string << SINGLE[whole] + "Thousand "
# 		num -= (whole * 1000)
#     if num < 100 && num > 0
#       string << "and "
#     end
#   end

#   if num >= 100
#     whole = num/100
#     string << SINGLE[whole] + "Hundred "
#     num -= (whole * 100)
#     if num > 0
#       string << "and "
#     end
#   end

#   if num > 19
#     whole = num/10
#     string << DOUBLE[whole]
#     num -= (whole * 10)
#     if num > 0
#       string << "and "
#     end
#   end

#   if num > 12
#     whole = num % 10
#     string << TEEN[whole]
#     num -= num
#   end

#   if num > 0
#     string << SINGLE[num]
#     num -= num
#   end
#   puts string
# end

SINGLE ={
1 => "One ",
2 => "Two ",
3 => "Three ",
4 => "Four ",
5 => "Five ",
6 => "Six ",
7 => "Seven ",
8 => "Eight ",
9 => "Nine "
}

TEEN ={
0 => "Ten",
1 => "Eleven",
2 => "Twelve",
3 => "Thirteen ",
4 => "Fourteen ",
5 => "Fifteen ",
6 => "Sixteen ",
7 => "Seventeen ",
8 => "Eighteen ",
9 => "Nineteen "
}

DOUBLE ={
2 => "Twenty ",
3 => "Thirty ",
4 => "Forty ",
5 => "Fifty ",
6 => "Sixty ",
7 => "Seventy ",
8 => "Eighty ",
9 => "Ninety "
}

def name(num, value, word)
  if num > value
    whole = num/value
    print SINGLE[whole] + "#{word}"
    num -= (whole * value)
  end
  num #returns num if false
end

def doubles(num)
  if num > 10
    whole = num/10
    remainder = num % 10
    if whole > 1
      print DOUBLE[whole]
      num -= (whole * 10)
    elsif whole == 1
      print TEEN[remainder]
      num -= num
    end
  end
  #returns num if false
end

def wordify(num)
  num = name(num, 1000, "Thousand ")
  num = name(num, 100, "Hundred ")
  num = doubles(num)
  num = SINGLE[num]
  puts num
end

wordify(9909)
wordify(15)
wordify(0)
