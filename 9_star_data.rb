require 'pry'

# years_array = [
# { :1901 => 9, :element => "fire" },
# { :1902 => 8, :element => "earth" },
# { :1903 => 7, :element => "metal" },
# { :1904 => 6, :element => "metal" },
# { :1905 => 5, :element => "earth" },
# { :1906 => 4, :element => "wood" },
# { :1907 => 3, :element => "wood" },
# { :1908 => 2, :element => "earth" },
# { :1909 => 1, :element => "water" },
# ]

nine = {Nine Fire: Lover}
eight = {Eight Earth: Transformer}
seven = {Seven Metal: Artist}
six = {Six Metal: Father}
five = {Five Earth: Center}
four  = {Four Wood: Guide}
three = {Three Wood: Warrior}
two = {Two Earth: Mother}
one = {One Water: Innovator}

  # binding.pry
# def get_first_number
#   years_array.each do |year|
#   puts "#{year[:year]}: #{year[:number]} #{year[:element]}"
#   end
# end

# def year_ki(year)
# if year > 1899 && year < 2000
#   four_digit_array = year.to_s.split("")
#   three_digit_array = four_digit_array.delete_at(0)
#   two_digit_array = three_digit_array.delete_at(0)
# end

# def year_math(2_digit_array)
#   value1 =two_digit_array[0].to_i
#   value2 = two_digit_array[1].to_i
#   value3 = value1 + value2
# end

# two_digit_array.year_math(two_digit_array)

#   case value3
#   when value3 < 10
#     final_value = 10 - value3
#   when value3 > 10
#     two_digit_array = value3.to_s.split("")
#     two_digit_array.year_math(two_digit_array)
#     final_value = 10 - value3
#   end


def get_year_ki(year)
  if year.to_s.match(/19\d\d/)
  if year.to_s.match(/20\d\d/)
end

  def twentieth_cent_year_ki(year)
    value1 = year.to_s.match(/19(\d)\d/).to_i
    value2 = year.to_s.match(/19\d(\d)/).to_i
    value3 = value1 + value2
  end

  def twentieth_cent_value3_math(value3)
    case value3
      when value3 < 10
        final_value = 10 - value3
      when value3 >= 10
        value1 = value3.match(/(\d)\d/).to_i
        value2 = value3.match(/\d(\d)/).to_i
        value3 = value1 + value2
        final_value = 10 - value3
      end
  end

  def twentyfirst_cent_year_ki(year)
    value1 = year.to_s.match(/20(\d)\d/).to_i
    value2 = year.to_s.match(/20\d(\d)/).to_i
    value3 = 2 + 0 + value1 + value2
  end

  def twentyfirst_cent_value3_math(value3)
    case value3
      when value3 < 10
        final_value = 11 - value3
      when value3 >= 10
        value1 = value3.match(/(\d)\d/).to_i
        value2 = value3.match(/\d(\d)/).to_i
        value3 = value1 + value2
        final_value = 11 - value3
      end
  end







# def describe_element

