class HostsController < ApplicationController
  def create
    host = Host.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if host.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: host.errors.full_messages}, status: :bad_request
    end
  end

end

