class HomeAmenity < ApplicationRecord
  # # has_many :homes     #TODO eh does it really? 
  # belongs_to :home
  # belongs_to :amentity, optional: true
  # #belongs_to :host, through: :home #TODO what if host wants to "recycle"/reuse a amentity template for multiple homes - i.e. they buy 5 kerigs for 5 homes?

end
