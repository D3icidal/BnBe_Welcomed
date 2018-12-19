class UsersController < ApplicationController
     

  def create
    user = User.new(
      first_name: params[:first_name] || nil,
      last_name: params[:last_name] || nil,
      email: params[:email] || nil,
      phone: params[:phone] || nil,
      bio: params[:bio] || nil,
      image_url: params[:image_url] || nil,      
      password: params[:password] || "password",
      password_confirmation: params[:password_confirmation] || "password"
    )
    if user.save
      # render json: {message: 'User created successfully'}, status: :created
      puts "\n\n\tUser created and saved!!!! #{user} #{user.email}\t*******\n\n"
      redirect_to "/users/#{user.id}"
    else
      puts "\n\n\tUser created but failed to save!!!! #{user} #{user.email}\t*******\n\n"
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  # def index

  # end

  def show
    if User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
      # render 'show.html.erb'
      render 'show.json.jbuilder'
    else
      render json: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end

  def edit
    if User.find_by(id: params[:id])
      @user = User.find_by(id: params[:id])
      render "edit.html.erb"
    else
      render json: "Bad lookup. ID searched: #{params[:id]}" #TODO make an error page
    end
  end


  def update    
    @user = User.find_by(id: params[:id])
    @user.first_name = params[:first_name] || nil
    @user.last_name = params[:last_name] || nil
    @user.email = params[:email] || nil
    @user.phone = params[:phone] || nil
    @user.bio = params[:bio] || nil
    @user.image_url = params[:image_url] || nil,     
    #@user.password = params[:password] || "password"
    #@user.password_confirmation = params[:password_confirmation] || "password"

    if @user.save
      # render json: {message: 'User created successfully'}, status: :created
      redirect_to "/homes/#{@user.id}" #redirect to showpage
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  # def destroy #might skip this one
  # end

end

