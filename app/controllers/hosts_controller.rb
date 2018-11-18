class HostsController < ApplicationController
  def new
    render 'new.html.erb'
  end
      

  def create
    host = Host.new(
      first_name: params[:first_name] || nil,
      last_name: params[:last_name] || nil,
      email: params[:email] || nil,
      phone: params[:phone] || nil,
      bio: params[:bio] || nil,
      image_url: params[:image_url] || nil,      
      password: params[:password] || "password",
      password_confirmation: params[:password_confirmation] || "password"
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
      # render 'show.html.erb'
      render 'show.json.jbuilder'
    else
      render json: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end

  def edit
    if Host.find_by(id: params[:id])
      @host = Host.find_by(id: params[:id])
      render "edit.html.erb"
    else
      render json: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end


  def update    
    @host = Host.find_by(id: params[:id])
    @host.first_name = params[:first_name] || nil
    @host.last_name = params[:last_name] || nil
    @host.email = params[:email] || nil
    @host.phone = params[:phone] || nil
    @host.bio = params[:bio] || nil
    @host.image_url = params[:image_url] || nil,     
    #@host.password = params[:password] || "password"
    #@host.password_confirmation = params[:password_confirmation] || "password"

    if @host.save!
      # render json: {message: 'Host created successfully'}, status: :created
      redirect_to "/homes/#{@host.id}" #redirect to showpage
    else
      render json: {errors: host.errors.full_messages}, status: :bad_request
    end
  end

  # def destroy #might skip this one
  # end

end

