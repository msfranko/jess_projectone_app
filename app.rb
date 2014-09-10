require_relative 'nine_star'
require 'sinatra/base'
require 'redis'
require 'json'
require 'uri'
require 'pry'

class App < Sinatra::Base
  include NineStar

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
#   NUMBER_DESCRIPTIONS = [
# "Nine Fire: Lover",
# "Eight Earth: Transformer",
# "Seven Metal: Artist",
# "Six Metal: Father",
# "Five Earth: Center",
# "Four Wood: Guide",
# "Three Wood: Warrior",
# "Two Earth: Mother",
# "One Water: Innovator",
# ]

# def calculate_year_ki(year)
#   value1 = year.to_i % 9
#   case value1
#     when 2
#       # element = nine_fire
#       NUMBER_DESCRIPTIONS[0]
#     when 3
#       # element = eight_earth
#       NUMBER_DESCRIPTIONS[1]
#     when 4
#       # element = seven_metal
#       NUMBER_DESCRIPTIONS[2]
#     when 5
#       # element = six_metal
#       NUMBER_DESCRIPTIONS[3]
#     when 6
#       # element = five_earth
#       NUMBER_DESCRIPTIONS[4]
#     when 7
#       # element = four_wood
#       NUMBER_DESCRIPTIONS[5]
#     when 8
#       # element = three_wood
#       NUMBER_DESCRIPTIONS[6]
#     when 0
#       # element = two_earth
#       NUMBER_DESCRIPTIONS[7]
#     when 1
#       # element = one_water
#       NUMBER_DESCRIPTIONS[8]
#   end
# end

  ########################
  # Routes
  ########################
  get('/') do
    @user_ki = []
    $redis.keys.each do |key|
      @user_ki$redis.get(key)
    render :erb, :index
  end

  get('/user_ki/:id') do
    @user_ki = get_model_from_redis("user_ki:#{params[:id]}")
    @user_ki["show"] = true
    render(:erb, :"description/show")
  end

  get('/birthdate') do

    render :erb, :birthdate
  end

  #should it be /descriptions or /birthdate?
  post('/user_ki') do
    year  = params[:year].to_i
    month = params[:month].to_i
    day   = params[:day].to_i

    # FIXME breaks in browser when month == Jan
    if year != 0 && month != 0 && day != 0
      @star_ki_number  = Date.new(year,month,day).star_ki_number
      @star_ki_element = Date.new(year,month,day).star_ki_element
    end
    new_id = $redis.keys.size + 1
  # user_ki is redis model
    $redis.set("user_ki:#{new_id}", {:star_ki_number => @star_ki_number, :star_ki_element => @star_ki_element})
    redirect to "/user_ki/#{new_id}"
  end
end
