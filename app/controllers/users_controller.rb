class UsersController < ApplicationController
     

  def create
    user = User.new(
      first_name: params[:first_name] || "",
      last_name: params[:last_name] || "",
      email: params[:email] || "",
      phone: params[:phone] || "",
      bio: params[:bio] || "",
      image_url: params[:image_url] || "",      
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
    @user.first_name = params[:first_name] || ""
    @user.last_name = params[:last_name] || ""
    @user.email = params[:email] || ""
    @user.phone = params[:phone] || ""
    @user.bio = params[:bio] || ""
    @user.image_url = params[:image_url] || "",     
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

