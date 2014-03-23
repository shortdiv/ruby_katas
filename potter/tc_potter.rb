require_relative 'potter'
require 'minitest/spec'
require 'minitest/autorun'

describe Potter do
  before do
    @cart = Potter.new
  end

  describe "cost of books in empty cart" do
    before { @result = @cart.cost([]) }

    it "will return cost of empty cart" do
      @result.must_equal 0
    end
  end

  describe "cost of 1 book" do
    before { @result = @cart.cost(["1st"]) }

    it "will return the cost of 1 book" do
      @result.must_equal 8
    end
  end

  describe "takes in a full array of books" do
    before { @result = @cart.difference(["1st", "2nd", "1st"]) }

    it "will return the remainder non unique elements" do
      @result.must_equal (["1st"])
    end
  end

  describe "how much the additional non diff books cost" do
    before { @result = @cart.cost(["1st", "2nd", "1st"])}

    it "will return cost of additional books" do
      @result.must_equal 8
    end
  end

end


# 2 diff books => 5% discount on total
# 3 diff books => 10% discount on total
# 4 diff books => 20% discount on total
# 5 diff books => 25% discount on total