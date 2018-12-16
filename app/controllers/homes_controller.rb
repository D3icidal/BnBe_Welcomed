class HomesController < ApplicationController
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
    puts "\n\t\t homes - index. find_by(user_id: #{current_user.id}\t***********\n\n"
    #TODO maybe change this to case/when 
    render "index.json.jbuilder" if @homes.length > 1 ##index fo all homes
    redirect_to "/homes/#{@homes.first.id}" if @homes.length == 1 #show the 1 home #TODO tested?
    redirect_to "/homes/new" if @homes.length == 0    #no homes = make new home
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
      render json: {message: 'Home created successfully'}, status: :created
    else
      puts "\n\n\tinside create, home failed! #{@home}\n\n"
      render json: {errors: @home.errors.full_messages}, status: :bad_request
    end
  end

  # def index

  # end
  def show
    if current_user
      puts "\n\n\tCurrent User: #{current_user} #{current_user.email}\t*******\n\n" 
    else
      puts "\n\n\t No User Logged in !!! ********* \n\n"
    end
    if Home.find_by(id: params[:id])
      @home = Home.find_by(id: params[:id])
      # render "show.html.erb"
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
      
    if @home.save!
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

end
