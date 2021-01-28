class Neighborhood < ApplicationRecord
  belongs_to :city
  has_many :listings

  def combine_city_state
    self.neighborhood_name + ' - ' + self.city.city_name
  end

end
