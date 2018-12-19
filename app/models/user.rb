class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true 
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :homes
  has_many :bookings, through: :homes
  has_many :images, through: :homes  
  has_many :amenities, through: :homes #TODO extend to :amentity?
end

# # {message: "Did you forget to add a email?"}
# {message: "Email is already taken, perhaps you wanted to login instead?"}
  # 