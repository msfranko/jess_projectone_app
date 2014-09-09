require 'sinatra/base'
require 'redis'
require 'json'
require 'uri'
require 'pry'

class App < Sinatra::Base

  ########################
  # Configuration
  ########################

  configure do
    enable :logging
    enable :method_override
    enable :sessions
    uri = URI.parse(ENV["REDISTOGO_URL"])
    $redis = Redis.new({:host => uri.host,
                        :port => uri.port,
                        :password => uri.password})
  end

  before do
    logger.info "Request Headers: #{headers}"
    logger.warn "Params: #{params}"
  end

  after do
    logger.info "Response Headers: #{response.headers}"
  end


  ########################
  # Objects & Methods
  ########################
  NUMBER_DESCRIPTIONS = [
"Nine Fire: Lover",
"Eight Earth: Transformer",
"Seven Metal: Artist",
"Six Metal: Father",
"Five Earth: Center",
"Four Wood: Guide",
"Three Wood: Warrior",
"Two Earth: Mother",
"One Water: Innovator",
]

def calculate_year_ki(year)
  value1 = year.to_i % 9
  case value1
    when 2
      # element = nine_fire
      NUMBER_DESCRIPTIONS[0]
    when 3
      # element = eight_earth
      NUMBER_DESCRIPTIONS[1]
    when 4
      # element = seven_metal
      NUMBER_DESCRIPTIONS[2]
    when 5
      # element = six_metal
      NUMBER_DESCRIPTIONS[3]
    when 6
      # element = five_earth
      NUMBER_DESCRIPTIONS[4]
    when 7
      # element = four_wood
      NUMBER_DESCRIPTIONS[5]
    when 8
      # element = three_wood
      NUMBER_DESCRIPTIONS[6]
    when 0
      # element = two_earth
      NUMBER_DESCRIPTIONS[7]
    when 1
      # element = one_water
      NUMBER_DESCRIPTIONS[8]
  end
end

  ########################
  # Routes
  ########################
  get('/') do
    render :erb, :index
  end

  get('/birthdate') do
    @year = params[:year]
    element_result = calculate_year_ki(@year)
    render :erb, :birthdate
    end
  end
