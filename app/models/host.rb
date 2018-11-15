class Host < ApplicationRecord
  has_secure_password
  #validates :email, presence: true, uniqueness: true
  has_many :homes
  has_many :images, through: :homes  
  has_many :home_amenities, through: :homes #TODO extend to :amentity?
end
