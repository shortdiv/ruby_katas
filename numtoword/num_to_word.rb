class NumberstoWords

  def initialize(num)
    raise unless num.is_a?(Numeric)
  end

  def self.split_num(num, value)
    whole = (num/value) * value
  end

  def self.take_away(num, value)
    num -= split_num(num,value)
  end

  num_word = ["Zero ", "One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine ", "Ten "]
  tens_place = ["Error, number length cannot be zero", "", "special case ", "Hundred ", "Thousand ", "Ten Thousand"]

  def self.num_array(num)
    num_list =[]
    places = [1000, 100, 10, 1]

    for place in places
      if num > place
        num_list << split_num(num, place)
        num = take_away(num, place)
      end
    end

    print num_list

  end

end

