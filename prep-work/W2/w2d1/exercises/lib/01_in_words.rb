class Fixnum

  ONES_IN_WORDS = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }

  TEENS_IN_WORDS = {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
  }

  TENS_IN_WORDS = {
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
  }

  MAGNITUDES = {
    1_000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion"
  }


  def in_words
    num = self
    case
    when num < 10
      ONES_IN_WORDS[num]
    when num < 20
      TEENS_IN_WORDS[num]
    when num < 100
      if num % 10 == 0
        TENS_IN_WORDS[num]
      else
        tens = num / 10
        ones = num % 10
        "#{TENS_IN_WORDS[tens*10]} #{ones.in_words}"
      end
    else
      if num/1000 == 0 #We're in the hundreds
        hundreds_through_thousand(num)
      else #We're above 999
        thousand_and_greater(num)
      end
    end
  end

  private

  def hundreds_through_thousand(num)
    hundred = num / 100
    tens = num % 100
    tens_word = tens == 0 ? "" : " #{tens.in_words}" #so it doesn't print "zero"
    "#{hundred.in_words} hundred#{tens_word}"
  end

  def thousand_and_greater(num)
    words = []
    thousands_exponent = ((num.to_s.length)-1)/3 #This is 1000 ** thousands_exponent
    thousands_exponent.downto(1) do |exponent|
      thousands_powered = 1000 ** exponent #thousand, million, billion or trillion
      thousands_units = num / thousands_powered #how many (thousand, million, billion or trillion)
      next if thousands_units == 0 #so it doesn't print "zero"
      words << [thousands_units.in_words, MAGNITUDES[thousands_powered]]
      num %= thousands_powered #number becomes the rest, minus the (thousand, million, billion or trillion)
    end
    thousands_units = num % 1000
    words << thousands_units.in_words unless thousands_units == 0 #so it doesn't print "zero"
    words.join(" ")
  end

end
