class Home < ApplicationRecord
  belongs_to :host 
  has_many :guestbook_comments
  has_many :bookings
  has_many :guestbook_comments
  has_many :home_amenities
  has_many :amenities, through: :home_amenities
  has_many :images
end
