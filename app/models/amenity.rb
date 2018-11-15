class Amenity < ApplicationRecord
  has_many :home_amentities
  belongs_to :home
end
