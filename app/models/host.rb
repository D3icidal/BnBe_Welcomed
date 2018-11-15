class Host < ApplicationRecord
  has_secure_password
  #validates :email, presence: true, uniqueness: true
  has_many :homes
  has_many :bookings, through: :homes
  has_many :images, through: :homes  
  has_many :amenities, through: :homes #TODO extend to :amentity?
end
