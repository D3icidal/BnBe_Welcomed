class HomesController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    home = Home.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      image_url: params[:image_url],      
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if home.save!
      render json: {message: 'Home created successfully'}, status: :created
      # redirect_to "/hosts/#{home.id}"
    else
      render json: {errors: home.errors.full_messages}, status: :bad_request
    end
  end

  # def index

  # end

  def show
    if Home.find_by(id: params[:id])
      @home = Home.find_by(id: params[:id])
      render 'show.html.erb'
    else
      render html: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end

  # def update
  # end

  # def destroy #might skip this one
  # end

end


end
