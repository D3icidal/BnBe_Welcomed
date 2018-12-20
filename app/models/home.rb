class Home < ApplicationRecord
  belongs_to :user 
  has_many :guestbook_comments
  has_many :bookings
  has_many :amenities
  has_many :images
  has_many :sections

  validates :name, presence: true #must have a name
  validates :guest_password, presence: true, uniqueness: true

end

