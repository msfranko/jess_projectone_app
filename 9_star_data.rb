# module 9StarData
require 'pry'

KI_NUMBERS = [
  [1901, 1910, 1919, 1928, 1937, 1946, 1955, 1964, 1973, 1982, 1991, 2000, 2009],
  [1902, 1911, 1920, 1929, 1938, 1947, 1956, 1965, 1974, 1983, 1992, 2001, 2010],
  [1903, 1912, 1921, 1930, 1939, 1948, 1957, 1966, 1975, 1984, 1993, 2002, 2011],
  [1904, 1913, 1922, 1931, 1940, 1949, 1958, 1967, 1976, 1985, 1994, 2003, 2012],
  [1905, 1914, 1923, 1932, 1941, 1950, 1959, 1968, 1977, 1986, 1995, 2004, 2013],
  [1906, 1915, 1924, 1933, 1942, 1951, 1960, 1969, 1978, 1987, 1996, 2005, 2014],
  [1907, 1916, 1925, 1934, 1943, 1952, 1961, 1970, 1979, 1988, 1997, 2006, 2015],
  [1908, 1917, 1926, 1936, 1944, 1953, 1962, 1971, 1980, 1989, 1998, 2007, 2016],
  [1909, 1918, 1927, 1937, 1945, 1954, 1963, 1972, 1981, 1990, 1999, 2008, 2017],
]


# def get_year_ki(year)
#   KI_NUMBERS.each do |years_array|
#     if years_array.include?(year)
#        puts years_array
#     end
#   end
# end

def calculate_year_ki(year)
  value1 = year % 9
  case value1
    when 2 element = nine_fire
    when 3 element = eight_earth
    when 4 element = seven_metal
    when 5 element = six_metal
    when 6 element = five_earth
    when 7 element = four_wood
    when 8 element = three_wood
    when 0 element = two_earth
    when 1 element = one_water
  end
end


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

# nine = {Nine Fire: Lover}
# eight = {Eight Earth: Transformer}
# seven = {Seven Metal: Artist}
# six = {Six Metal: Father}
# five = {Five Earth: Center}
# four  = {Four Wood: Guide}
# three = {Three Wood: Warrior}
# two = {Two Earth: Mother}
# one = {One Water: Innovator}

  # binding.pry
# def get_first_number(year)
#     years_array.fetch do |year|
#     puts "#{year[:year]}: #{year[:number]} #{year[:element]}"
#     end
#   end

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


# def calculate_year_ki(year)
#    value1 = year.to_s.match(/(\d)\d\d\d/).to_i
#    value2 = year.to_s.match(/\d(\d)\d\d/).to_i
#    value3 = year.to_s.match(/\d\d(\d)\d/).to_i
#    value4 = year.to_s.match(/\d\d\d(\d)/).to_i
#    value5 = value1 + value2 + value3 + value4
#     case value5
#       when value5 < 10
#         final_value = 11 - value5
#       when value5 >= 10
#         value1 = value5.match(/(\d)\d/).to_i
#         value2 = value5.match(/\d(\d)/).to_i
#         value3 = value1 + value2
#         final_value = 11 - value3
#     end
# end


#   def twentieth_cent_year_ki(year)
#     value1 = year.to_s.match(/19(\d)\d/).to_i
#     value2 = year.to_s.match(/19\d(\d)/).to_i
#     value3 = value1 + value2
#   end

#   def twentieth_cent_value3_math(value3)
#     case value3
#       when value3 < 10
#         final_value = 10 - value3
#       when value3 >= 10
#         value1 = value3.match(/(\d)\d/).to_i
#         value2 = value3.match(/\d(\d)/).to_i
#         value3 = value1 + value2
#         final_value = 10 - value3
#       end
#   end

#   def twentyfirst_cent_year_ki(year)
#     value1 = year.to_s.match(/20(\d)\d/).to_i
#     value2 = year.to_s.match(/20\d(\d)/).to_i
#     value3 = 2 + 0 + value1 + value2
#   end

#   def twentyfirst_cent_value3_math(value3)
#     case value3
#       when value3 < 10
#         final_value = 11 - value3
#       when value3 >= 10
#         value1 = value3.match(/(\d)\d/).to_i
#         value2 = value3.match(/\d(\d)/).to_i
#         value3 = value1 + value2
#         final_value = 11 - value3
#       end
#   end


# def describe_element





# end
