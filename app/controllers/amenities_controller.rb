class AmenitiesController < ApplicationController
  def show #all of a single homes amentities :id=home
    if current_user
      puts "\n\n\t in amenities show. Current user #{current_user.email}\n\n"
      if Home.find_by(id: params[:home_id]).amenities 
        amenities = Home.find_by(id: params[:home_id]).amenities
      else
        amenities = []
      end
      render json: amenities
    else
      puts "\n\n\t Bad current_user, maybe login?"
      render json: "bad user, maybe log in?", status: :unauthorized
    end
  end

  def index #all amenities belonging to a user
    if current_user
      puts "\n\n\t in amenities index. Current user #{current_user.email}\n\n"
      amenities = current_user.amenities
      render json: amenities
    else
      puts "\n\n\t Bad current_user, maybe login?"
      render json: "bad user, maybe log in?", status: :unauthorized
    end
  end

  def create
    if current_user
      puts "\n\n\tCurrent User: #{current_user} #{current_user.email}\t*******\n\n" 
    else
      puts "\n\n\t No User Logged in !!! ********* \n\n"
      puts "\n\n\tfailed in create**********\n"
      render json: {errors: @person.errors.full_messages}, status: :bad_request
    end
    @amenity = Amenity.new(
      name: params[:name],  #must have a name or fails validation
      is_usable: true,
      icon_url: params[:icon_url] || "",      
      instructions: params[:instructions] || "",
      location: params[:location] || "",
      home_id: params[:home_id] || ""
      )

    if @amenity.save
      puts "\n\n\tinside create, amenity saved! #{@amenity}\n\n"
      render json: {message: 'Amenity created successfully'}, status: :created
    else
      puts "\n\n\tinside create, amenity failed! #{@amenity}\n\n"
      render json: {errors: @amenity.errors.full_messages}, status: :bad_request
    end
  end
end
