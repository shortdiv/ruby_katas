#convert numbers to words 

def worded(number)
	case number
	when 1 then " One"
	when 2 then " Two"
	when 3 then " Three"
	when 4 then " Four"
	when 5 then " Five"
	when 6 then " Six"
	when 7 then " Seven"
	when 8 then " Eight"
	when 9 then " Nine"
	when 10 then "Ten"
	when 11 then "Eleven"
	when 12 then "Twelve"
	end
end

def tens(number)
	case number 
	when 2 then "Twenty"
	when 3 then "Thirty"
	when 4 then "Forty"
	when 5 then "Fifty"
	when 6 then "Sixty"
	when 7 then "Seventy"
	when 8 then "Eighty"
	when 9 then "Ninety"
	end
end

def name(remain, value, decimal)
	if remain > value
		whole = remain/value
		words = worded(whole)
		print words + "#{decimal}"
		remain -= (whole * value)
	end
end

def teens(remainder)
	if remainder >= 20
		doubles = remainder/10
		leftover = remainder % 10
		puts tens(doubles) +  worded(leftover)
	elsif remainder > 12
		single = remainder % 10
		puts worded(single) + " teen "
	else
		puts worded(remainder)
	end
end

teens(55)
teens(12)
teens(9)


def wordify(remainder)
	remainder = name(remainder, 1000, " thousand ")
	remainder = name(remainder, 100, " hundred ")
end

wordify(4560)
