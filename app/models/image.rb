class Image < ApplicationRecord
  belongs_to :home
  belongs_to :user, optional: true #Removed: host does not have own photos besides 1 avatar.

  #Helper Methods
  def urls
    return url
  end

end
