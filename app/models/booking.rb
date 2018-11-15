class Booking < ApplicationRecord
  belongs_to :host, through: :home
  has_many :guestbook_comments,
  belongs_to :home
  # has_many :images,  #TODO maybe add images to bookings, or to comments?  
end
