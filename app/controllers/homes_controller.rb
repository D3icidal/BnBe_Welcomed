class HomesController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def index
    @homes = Home.where(host_id: Host.first.id)      #TODO host_id: 1 used for simplicity, eventually add authentication current_user. This also returns all homes, not just "Active" ones
    puts "\n\t\t homes - index. find_by(host_id: #{Host.first.id}"
    # render "index.html.erb"
    render "index.json.jbuilder"
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
      # render "show.html.erb"
      render "show.json.jbuilder"
    else
      render json: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end


  def edit
    if Home.find_by(id: params[:id])
      @home = Home.find_by(id: params[:id])
      render "edit.html.erb"    #TODO will be replaced by vue
    else
      render json: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end


  def update    
    @home = Home.find_by(id: params[:id])
    @home.name = params[:name]
    @home.host_id = Host.first.id   #TODO hardcoded
    @home.is_active = params[:is_active] || true
    @home.wifi_password = params[:wifi_password] || nil      
    @home.bedrooms = params[:bedrooms] || 1
    @home.bathrooms = params[:bathrooms] || 1
    @home.zipcode = params[:zipcode]
    @home.street_address = params[:street_address]
    @home.state = params[:state]
      
    if @home.save!
      # render json: {message: 'Home created successfully'}, status: :created
      redirect_to "/homes/#{@home.id}"
    else
      render json: {errors: home.errors.full_messages}, status: :bad_request
    end
  end

  # def destroy #might skip this one
  # end

end
