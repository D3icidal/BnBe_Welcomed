class Image < ApplicationRecord
  belongs_to :home
  belongs_to :host, optional: true #Removed: host does not have own photos besides 1 avatar.
end
