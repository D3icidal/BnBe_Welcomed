class HomesController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def index
    @homes = Home.where(host_id: Host.first.id)      #TODO host_id: 1 used for simplicity, eventually add authentication current_user. This also returns all homes, not just "Active" ones
    puts "\n\t\t homes - index. find_by(host_id: #{Host.first.id}"
    render "index.html.erb"
  end

  def create
    @home = Home.new(
      name: params[:name],
      host_id: Host.first.id,   #TODO hardcoded
      is_active: params[:is_active] || true,
      wifi_password: params[:wifi_password] || nil,      
      bedrooms: params[:bedrooms] || 1,
      bathrooms: params[:bathrooms] || 1,
      zipcode: params[:zipcode]
      )

    if @home.save!
      # render json: {message: 'Home created successfully'}, status: :created
      redirect_to "/homes/#{home.id}"
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
