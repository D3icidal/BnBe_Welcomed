class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 800.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
      )
      render json: {jwt: jwt, email: user.email, user_id: user.id}, status: :created
    else
      puts "\n\n\tseessions_controller AUTH ERROR!!! User: #{user}, email used for lookup #{params[:email]}. \t*****8\n\n"
      render json: {}, status: :unauthorized
    end
  end

end
