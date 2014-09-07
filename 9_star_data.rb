require 'pry'

years_array = [
{ :year => 1901, :number => 9, :element => "fire" },
{ :year => 1902, :number => 8, :element => "earth" },
{ :year => 1903, :number => 7, :element => "metal" },
{ :year => 1904, :number => 6, :element => "metal" },
{ :year => 1905, :number => 5, :element => "earth" },
{ :year => 1906, :number => 4, :element => "wood" },
{ :year => 1907, :number => 3, :element => "wood" },
{ :year => 1908, :number => 2, :element => "earth" },
{ :year => 1909, :number => 1, :element => "water" },
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

def describe_element

