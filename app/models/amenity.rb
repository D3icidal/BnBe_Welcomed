class Amenity < ApplicationRecord
  belongs_to :home  
  validates :name, presence: true #must have a name

  def example(homeid) #Example amenity incase user has less than 4 amenities

    # return Amenity.find_by(id: 999) #don't rely on database entries

    example1 = Amenity.new(
      :id => Amenity.last.id + 1,
      :name => "Example: Coffee Maker", 
      :icon_url => "https://img.icons8.com/wired/64/000000/cafe.png", 
      :instructions => "Use the filtered water in the fridge, add some coffee from the blue container on the right, place your cup down first, and then press start. Please use only mugs and NOT the glasses! Thank you!\n In the fridge there is creamer, milk, and sugar - help yourself.", 
      :location => "Next to the stove. Milk/Creamer in the fridge. If you need more ground coffee, check under the sink!", 
      :is_usable => true, 
      :home_id => homeid, 
      :created_at => Time.now, 
      :updated_at => Time.now
      )

    example2 = Amenity.new(
      :id => Amenity.last.id + 2,
      :name => "Example: Washer and Dryer", 
      :icon_url => "https://img.icons8.com/wired/64/000000/washing-machine.png", 
      :instructions => "For the Washing Machine: Just add a little bit of soap (blue bottle), add your clothes, and hit start. You might have to hit the start button hard. \n Please just leave your towels/blankets anywhere, I will happily take care of washing those.", 
      :location => "Garage", 
      :is_usable => true, 
      :home_id => homeid, 
      :created_at => Time.now, 
      :updated_at => Time.now
    )

    example3 = Amenity.new(
      :id => Amenity.last.id + 3,
      :name => "Example: Pool", 
      :icon_url => "https://img.icons8.com/ios/50/000000/swimming-pool.png", 
      :instructions => "Sorry the pool is closed for the winter, please do NOT try to use it or turn on the water!", 
      :location => "Backyard", 
      :is_usable => true, 
      :home_id => homeid, 
      :created_at => Time.now, 
      :updated_at => Time.now
    )

    example_amenities = [example1, example2, example3]
    p example_amenities
    return example_amenities
  end
end

