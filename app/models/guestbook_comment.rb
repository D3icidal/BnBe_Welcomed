class GuestbookComment < ApplicationRecord
  belongs_to :home
  belongs_to :host, through: :home
  #TODO has many images? or would that be pointless for the userside?
  belongs_to :booking, optional: true #eh maybe only need direction association to home, 
end
