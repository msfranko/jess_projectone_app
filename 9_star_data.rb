require 'pry'

years_array = [
{ :1901 => 9, :element => "fire" },
{ :1902 => 8, :element => "earth" },
{ :1903 => 7, :element => "metal" },
{ :1904 => 6, :element => "metal" },
{ :1905 => 5, :element => "earth" },
{ :1906 => 4, :element => "wood" },
{ :1907 => 3, :element => "wood" },
{ :1908 => 2, :element => "earth" },
{ :1909 => 1, :element => "water" },
]

# nine = {Nine Fi re: Lover}
# eight = {Eight Earth: Transformer}
# seven = {Seven Metal: Artist}
# six = {Six Metal: Father}
# five = {Five Earth: Center}
# four  = {Four Wood: Guide}
# three = {Three Wood: Warrior}
# two = {Two Earth: Mother}
# one = {One Water: Innovator}

  # binding.pry
def get_first_number
  years_array.each do |year|
  puts "#{year[:year]}: #{year[:number]} #{year[:element]}"
  end
end

def year_ki(year)
if year > 1899 && year < 2000
  four_digit_array = year.to_s.split("")
  three_digit_array = four_digit_array.delete_at(0)
  two_digit_array = three_digit_array.delete_at(0)
  value1 = two_digit_array[0].to_i
  value2 = two_digit_array[1].to_i
  value3 = value1 + value2
  if value3 < 10
    value4 = 10 - value3
  if value3 > 10
    value4 = value3.to_s.split("")





# def describe_element

