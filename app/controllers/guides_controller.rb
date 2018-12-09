class GuidesController < ApplicationController
  
  def index #maybe show a listing of all active homes that allow anonomos viewing.
  end  


  def show
    code = params[:code]
    if code == ""
      render json: "Empty code", status: 501
    elsif Home.all.any? { |h| h[:guest_password] == code }
      home = Home.find_by(guest_password: 'password')
      puts "\n\n\tFound home in guides show: #{home.name} id:#{home.id}\n\n"
      render json: home, status: 200
    else 
      puts "\n\n\tCode: #{code} not found.\n\n"
      render json: "Code not found", status: :bad_request
    end
  end
end
