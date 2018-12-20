class GuidesController < ApplicationController
  # require "ssh_wifi.rb"
  # def index #maybe show a listing of all active homes that allow anonomos viewing.
  # end  

  def show
    code = params[:code]    
    if code == ""
      render json: "Empty code", status: 501
    elsif Home.all.any? { |h| h[:guest_password] == code } #password exists in Homes database
      @home = Home.find_by(guest_password: code)
      puts "\n\n\tFound @home in guides show: #{@home.name} id:#{@home.id}\n\n"
      p @home
      # @ip = Ip.find_by(home_id: @home.id)
      # if @ip and @ip != nil
      #   puts "\n\n\t@ip\n"        
      #   @wifi = get_current
      #   puts @wifi
      # end
      @weather = weather(@home.zipcode)
      if @weather
        puts "\n\n\tWeather for #{@home.name} found: #{@weather.first}\n\n"
      else
        puts "\n\n\tFaking weather - issue with zip:#{@home.zipcode} weather: #{weather(@home.zipcode)}"
        @weather = weather(11214)
      end
      # render json: @home, status: 200
      render "show.json.jbuilder", status: 200
    else 
      puts "\n\n\tCode: #{code} not found.\n\n"
      render json: "Code not found", status: :bad_request
    end
  end


  def update #TODO move this to homes controller and just reuse route?
    puts "\n\n\tparams code:#{params[:code]} and id:#{params[:id]} "
    code = params[:code]
    @home = Home.find_by(id: params[:id])
    if @home
      if code == ""
        puts "\n\n\t#guides_update blank code!\n\n"
        render json: {errors: "Code cannot be blank"}, status: :bad_request
      else #Success
        puts "code changed to #{code} for home #{@home.id}: #{@home.name}"
        if @home.update(guest_password: code)
          render json: {messages: "Guest Guide password has been updated for home #{@home.id}: #{@home.name}", update: "#{code}"}
        else
          p @home.errors.full_messages
          render json: {errors: @home.errors.full_messages}, status: 501 #Guide-code already taken by another home/guide
        end
      end
    else
      render json: {errors: @home.errors.full_messages}, status: :bad_request
    end
  end

  ####### Helpers

  def weather(zipcode)
    response = HTTParty.get('https://weather.cit.api.here.com/weather/1.0/report.json?product=forecast_7days_simple&zipcode=' + 
      zipcode + 
      '&oneobservation=true&metric=false&app_id=' +
      Rails.application.credentials.dig(:hereappid) + 
      '&app_code=' +
      Rails.application.credentials.dig(:hereappcode) )
    forecast = []
    # p response
    response["dailyForecasts"]["forecastLocation"]["forecast"].each do |day| 
      forecast << day
    end
  end
end
