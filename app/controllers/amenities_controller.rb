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
end
