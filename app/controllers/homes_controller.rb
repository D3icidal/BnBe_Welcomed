class HomesController < ApplicationController
  # require "ssh_wifi.rb"
  before_action :authenticate_user  
  #JSON RETURNS ONLY

  def index #TODO validate current_user and put all logic inside that statement.
    if current_user
      puts "\n\n\tCurrent User: #{current_user} #{current_user.email}\t*******\n\n" 
    else
      puts "\n\n\t No User Logged in !!! ********* \n\n"
      puts "\n\n\tfailed in index**********\n"
      render json: {error: "Not Logged In"}, status: 401
    end    
    @homes = Home.where(user_id: current_user.id)    
    puts "\n\t\t homes - index.find_by(user_id: #{current_user.id}\t count:#{@homes.count} length:#{@homes.length}\t***********\n\n\tHomes:"
    p @homes    
    puts "if @homes.length == 1" if @homes.length == 1
    puts "if @homes.length == 0" if @homes.length == 0
    #TODO maybe change this to case/when 
    render "index.json.jbuilder" ##index fo all homes

    
  end

  def create
    if current_user
      puts "\n\n\tCurrent User: #{current_user} #{current_user.email}\t*******\n\n" 
    else
      puts "\n\n\t No User Logged in !!! ********* \n\n"
      puts "\n\n\tfailed in create**********\n"
      render json: {errors: @person.errors.full_messages}, status: :bad_request
    end
    @home = Home.new(
      name: params[:name],  #must have a name or fails validation
      user_id: current_user.id,   
      is_active: true,
      guest_password: params[:guest_password] || home_Code_Gen,      
      wifi_password: params[:wifi_password] || "",      
      bedrooms: params[:bedrooms] || 1,
      bathrooms: params[:bathrooms] || 1,
      street_address: params[:street_address] || "",
      zipcode: params[:zipcode] || "",
      state: params[:state] || ""
      # zipcode: params[:zipcode]
      )

    if @home.save
      puts "\n\n\tinside create, home saved! #{@home}\n\n"
      render json: @home.id, status: :created
    else
      puts "\n\n\tinside create, home failed! #{@home}\n\n"
      render json: {errors: @home.errors.full_messages}, status: :bad_request
    end
  end

  # def index

  # end
  def show    
    if Home.find_by(id: params[:id])
      @home = Home.find_by(id: params[:id])
      # render "show.html.erb"
      @weather = weather(@home.zipcode)
      if @weather
        puts "\n\n\tWeather for #{@home.name} found: #{@weather}\n\n"
      else
        puts "\n\n\tFaking weather - issue with zip:#{@home.zipcode} weather: #{weather(@home.zipcode)}"
        @weather = nil #TODO
      end
      render "show.json.jbuilder"
    else
      render json: "Bad lookup. ID searched: #{params[:id]}", status: :bad_request #TODO make an error page
    end
  end


  # def edit
  #   if Home.find_by(id: params[:id])
  #     @home = Home.find_by(id: params[:id])
  #     render "edit.html.erb"    #TODO will be replaced by vue
  #   else
  #     render json: "Bad lookup. ID searched: #{params[:id]}", status: :bad_request #TODO make an error page
  #   end
  # end


  def update    
    @home = Home.find_by(id: params[:id])
    @home.name = params[:name] || @home.name 
    # @home.user_id = current_user.id
    @home.is_active = params[:is_active] || true
    @home.wifi_password = params[:wifi_password] || @home.wifi_password      
    @home.guest_password = params[:guest_password] || @home.guest_password       
    @home.bedrooms = params[:bedrooms] || @home.bedrooms 
    @home.bathrooms = params[:bathrooms] || @home.bathrooms
    @home.zipcode = params[:zipcode] || @home.zipcode
    @home.street_address = params[:street_address] || @home.street_address
    @home.state = params[:state] || @home.state
      
    if @home.save
      render json: {message: 'Home created successfully'}, status: :created
      # redirect_to "/homes/#{@home.id}"
    else
      render json: {errors: @home.errors.full_messages}, status: :bad_request
    end
  end

  # def destroy #might skip this one
  # end


  ##########3 Helper / Misc Methods

  def home_Code_Gen
    (Faker::Hipster.word).downcase + rand(1..30).to_s
  end

  def weather(zipcode)
    response = HTTParty.get('https://weather.cit.api.here.com/weather/1.0/report.json?product=forecast_7days_simple&zipcode=' + 
      zipcode + 
      '&oneobservation=true&app_id=' +
      Rails.application.credentials.dig(:hereappid) + 
      '&app_code=' +
      Rails.application.credentials.dig(:hereappcode) )
    forecast = []
    p response
    response["dailyForecasts"]["forecastLocation"]["forecast"].each do |day| 
      forecast << day
    end
  end

  # def weather(zipcode) #using openweathermap (doesn't do daily weather)
  #   currentWeatherResponse = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?zip=' +
  #     zipcode + 
  #     '&appid=' +
  #     Rails.application.credentials.dig(:openweathermap) +
  #     '&units=imperial')
  #   forcastWeatherResponse = HTTParty.get('http://api.openweathermap.org/data/2.5/forecast?zip=' +
  #     zipcode + 
  #     '&appid=' +
  #     Rails.application.credentials.dig(:openweathermap) +
  #     '&units=imperial')
  #   currentWeather = currentWeatherResponse["weather"].first["description"]
  # end

end
