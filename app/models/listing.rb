class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :neighborhood, optional: true
  accepts_nested_attributes_for :neighborhood
  belongs_to :city
  has_many_attached :images

  validates :title, :duration, :price, :utilities, :initial_fee, :address, :description, :amenities, :room_mates, :bathrooms, presence: true

  def neighborhood_name=(name)
    self.neighborhood = Neighborhood.find_or_create_by(neighborhood_name: name)
  end

  def neighborhood_name
    self.neighborhood ? self.neighborhood.neighborhood_name : nil
  end

  def cbox_to_s(attribute)
    if attribute == true
      "Yes"
    else
      "No"
    end
  end

  def self.number_of_listings
    if Listing.all.count == 1
      "There is currently 1 listing"
    elsif Listing.all.count > 1
      "There are currently #{Listing.all.count} listings"
    else
      "There are currently no listings"
    end
  end

end
