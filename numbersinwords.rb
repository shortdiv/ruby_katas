Singles = ["", "one ", "two ", "three ", "four ", "five ", "six ", "seven ", "eight ", "nine ", "ten ", "eleven ", "twelve ", "thirteen ", "fourteen ", "fifteen ", "sixteen ", "seventeen ", "eighteen ", "nineteen "]
Doubles = ["", "", "twenty ", "thirty ", "forty ", "fifty ", "sixty ", "seventy ", "eighty ", "ninety "]

def wordify(num, value, word, list)
  if num >= value
      # Teens Case
      if num < 19 && num > 9
        print Singles[num]
      else
        whole = num/value
        print list[whole] + "#{word}"
        num -= (whole * value)
      end
  end
  num #return no
end

def whole_word(num)
  if num == 0
    return "zero"
  end
  num = wordify(num, 1000, "thousand ", Singles)
  num = wordify(num, 100, "hundred ", Singles)
  num = wordify(num, 10, "", Doubles)
  num = Singles[num]
end