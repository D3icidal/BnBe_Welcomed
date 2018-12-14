class GuidesController < ApplicationController
  
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
end
