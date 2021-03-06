class BookingsController < ApplicationController

  def create #Host creates a new booking
    # if current_user
    #   puts "\n\n\tCurrent User: #{current_user} #{current_user.email}\t*******\n\n" 
    # else
    #   puts "\n\n\t No User Logged in !!! ********* \n\n"
    #   puts "\n\n\tfailed in create for bookings controller**********\n"
    #   render json: {}, status: :bad_request
    # end

    booking = Booking.new(
      home_id: params[:home_id], #TODO redudant search,
      checkin: params[:checkin],
      checkout: params[:checkout],
      checkout_reason: params[:checkout_reason] || nil, #should be nil unless booking was forced by host for testing.
      code: params[:code] || "EXXSTEST" #TODO fake code for testing, should implement faker or hex-gen
      )

    if booking.save
      puts "\n\n\tinside create, booking saved! #{booking}\n\n"
      render json: {message: 'booking created successfully'}, status: :created
    else
      puts "\n\n\tinside create, booking failed! #{booking}\n\n"
      booking.save!
      render json: {errors: booking.errors.full_messages}, status: :bad_request
    end
  end

  def show
    if current_user
      puts "\n\n\t in bookings show. Current user #{current_user.email}\n\n"
      p current_user.bookings.ids.include?(params[:id])
      puts current_user.bookings.ids
      p params[:id]
      if current_user.bookings.ids.include?(params[:id].to_i)
        booking = Booking.find_by(id: params[:id])
        p booking
        render json: booking
      else
        puts "\n\n\n\tbooking_id #{params[:id]} does not belong to current user's bookings of: #{current_user.bookings.ids}\n\n"
      end
    else
      puts "\n\n\t Bad current_user, maybe login?"
      render json: "bad user, maybe log in?", status: :unauthorized
    end
  end

  def index
    if current_user
      puts "\n\n\t in bookings index. Current user #{current_user.email}"
      bookings = current_user.bookings
      p bookings
      render json: bookings
    else
      puts "\n\n\t Bad current_user (inside bookings index)"
      render json: "bad user, maybe log in?", status: :unauthorized
    end
  end

  def checkout

  end

end
