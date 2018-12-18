class Section < ApplicationRecord
  belongs_to :home  
  validates :name, presence: true #must have a name
end
