class Image < ApplicationRecord
  belongs_to :home
  belongs_to :host, through: :home
end
