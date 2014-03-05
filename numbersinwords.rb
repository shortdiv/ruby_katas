Singles = ["", "one ", "two ", "three ", "four ", "five ", "six ", "seven ", "eight ", "nine ", "ten ", "eleven ", "twelve ", "thirteen ", "fourteen ", "fifteen ", "sixteen ", "seventeen ", "eighteen ", "nineteen "]
Doubles = ["", "", "twenty ", "thirty ", "forty ", "fifty ", "sixty ", "seventy ", "eighty ", "ninety "]

def wordify(num, value, word, list)
  numberword = ""
  if num >= value
      # Teens Case
      if num < 19 && num > 9
        numberword = Singles[num]
      else
        whole = num/value
        numberword = list[whole] + "#{word}"
        num -= (whole * value)
      end
  end
  [num, numberword] #return no
end

def whole_word(num)
  word_array = []
  if num == 0
    return "zero"
  end
  num, word = wordify(num, 1000, "thousand ", Singles)
  word_array << word
  num, word = wordify(num, 100, "hundred ", Singles)
  word_array << word
  num, word = wordify(num, 10, "", Doubles)
  word_array << word
  word_array << Singles[num]
  word_array.join("")
end

puts whole_word(9860)

#destructured assignment