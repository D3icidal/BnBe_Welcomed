class BookingSessionsController < ApplicationController
  def create
    booking = Booking.find_by(code: params[:code])
    #TODO date validation of booking (make sure todays date is within booking)
    if booking
      jwt = JWT.encode(
        {
          booking_id: booking.id,
          home_id: booking.home_id,
          #anything else?
          exp: 800.hours.from_now.to_i # the expiration time #TODO this needs to be the time remaining in the checkin
        },
      )
      render json: {jwt: jwt, booking_id: booking.booking_id,home_id: booking.home_id }, status: :created
    else
      puts "\n\n\tBookingSEssions controller Auth or find error!! Booking used: #{booking}, code: #{params[:code]}\n\n"
      render json: {booking_id: booking.id, code: params[:code]}, status: :unauthorized
    end
  end

  # def find_Booking(code)

  # end
end
