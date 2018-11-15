class Home < ApplicationRecord
  belongs_to :host 
  has_many :guestbook_comments
  has_many :bookings
  has_many :guestbook_comments
  has_many :amenities
  has_many :images
end

