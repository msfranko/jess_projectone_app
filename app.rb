require 'sinatra/base'

class App < Sinatra::Base

  ########################
  # Configuration
  ########################

  configure do
    enable :logging
    enable :method_override
    enable :sessions
  end

  before do
    logger.info "Request Headers: #{headers}"
    logger.warn "Params: #{params}"
  end

  after do
    logger.info "Response Headers: #{response.headers}"
  end


  ########################
  # Methods
  ########################
def calculate_year_ki(year)
  value1 = year % 9
  case value1
    when 2
      # element = nine_fire
      puts NUMBER_DESCRIPTIONS[0]
    when 3
      # element = eight_earth
      puts NUMBER_DESCRIPTIONS[1]
    when 4
      # element = seven_metal
      puts NUMBER_DESCRIPTIONS[2]
    when 5
      # element = six_metal
      puts NUMBER_DESCRIPTIONS[3]
    when 6
      # element = five_earth
      puts NUMBER_DESCRIPTIONS[4]
    when 7
      # element = four_wood
      puts NUMBER_DESCRIPTIONS[5]
    when 8
      # element = three_wood
      puts NUMBER_DESCRIPTIONS[6]
    when 0
      # element = two_earth
      puts NUMBER_DESCRIPTIONS[7]
    when 1
      # element = one_water
      puts NUMBER_DESCRIPTIONS[8]
  end
end

  ########################
  # Routes
  ########################

  get('/') do
    render(:erb, :index)
  end
end
