class BookingsController < ApplicationController
  def create #Host creates a new booking
    if current_user
      puts "\n\n\tCurrent User: #{current_user} #{current_user.email}\t*******\n\n" 
    else
      puts "\n\n\t No User Logged in !!! ********* \n\n"
      puts "\n\n\tfailed in index**********\n"
      render json: {}, status: :bad_request
    end

    booking = Booking.new(
      home_id: Home.find_by(id: params[:homes_id]),
      checkout_reason: params[:checkout_reason], #should be nil unless booking was forced by host for testing.
      code: "EXXSTEST" #TODO fake code for testing, should implement faker or hex-gen
      )

    if booking.save
      puts "\n\n\tinside create, booking saved! #{booking}\n\n"
      render json: {message: 'booking created successfully'}, status: :created
    else
      puts "\n\n\tinside create, booking failed! #{booking}\n\n"
      render json: {errors: booking.errors.full_messages}, status: :bad_request
    end
  end

  def show

  end

  def index

  end

  def checkout

  end

end
