class HostsController < ApplicationController
  def new
    render 'new.html.erb'
  end


  def create
    host = Host.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      image_url: params[:image_url],      
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if host.save!
      # render json: {message: 'User created successfully'}, status: :created
      redirect_to "/hosts/#{host.id}"
    else
      render json: {errors: host.errors.full_messages}, status: :bad_request
    end
  end

  # def index

  # end

  def show
    if Host.find_by(id: params[:id])
      @host = Host.find_by(id: params[:id])
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

