class NumberstoWords

  def self.split_num(num, value)
    whole = (num/value) * value
  end

  def self.take_away(num, value)
    num -= split_num(num,value)
  end


  def self.num_array(num)
    num_list =[]
    places = [1000, 100, 10, 1]

    places.each do |place|
      if num > place
        num_list << split_num(num, place)
        num = take_away(num, place)
      end
    end
    num_list
  end

  def self.convert_word(num)
    num_word = ["Zero ", "One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine ", "Ten "]
    tens_place = ["Error, number length cannot be zero", "", "", "Hundred ", "Thousand ", "Ten Thousand"]
    teenty = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen", ]

    raise unless num.is_a?(Numeric)
    strang = ""
    self.num_array(num).each do |number|
      if number.to_s.length == 2 && number/10 == 1
        strang << teenty[number % 10]
      end
      strang << num_word[number.to_s.split("")[0].to_i] + tens_place[number.to_s.length]
    end
    print strang
  end

end


 # for item in num_list
 #      firstdigit = item.to_s.split("")[0]
 #    end