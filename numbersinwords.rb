#convert a number into words

def wordify(num)
  string = ""
    if num == 0
      string << "Zero"
    end

    if num > 1000
      whole = num/1000
      string << SINGLE[whole] + "Thousand "
      num -= (whole * 1000)
        if num < 100 && num > 0
          string << "and "
        end
    end

    if num >= 100
      whole = num/100
      string << SINGLE[whole] + "Hundred "
      num -= (whole * 100)
        if num > 0
          string << "and "
        end
    end

    if num > 19
      whole = num/10
      string << DOUBLE[whole]
      num -= (whole * 10)
        if num > 0
          string << "and "
        end
    end

    if num > 12
      whole = num % 10
      string << TEEN[whole]
      num -= num
    end

    if num > 0
      string << SINGLE[num]
      num -= num
    end

  puts string
  
end

SINGLE = {
 1 => "One ",
 2 => "Two ",
 3 => "Three ",
 4 => "Four ",
 5 => "Five ",
 6 => "Six ",
 7 => "Seven ",
 8 => "Eight ",
 9 => "Nine ",
 10 => "Ten ",
 11 => "Eleven ",
 12 => "Twelve "
 }

TEEN = {
 3 => "Thirteen ",
 4 => "Fourteen ",
 5 => "Fifteen ",
 6 => "Sixteen ",
 7 => "Seventeen ",
 8 => "Eighteen ",
 9 => "Nineteen "
}

DOUBLE = {
 2 => "Twenty ",
 3 => "Thirty ",
 4 => "Forty ",
 5 => "Fifty ",
 6 => "Sixty ",
 7 => "Seventy ",
 8 => "Eighty ",
 9 => "Ninety "
}


