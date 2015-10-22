class Sighting < ActiveRecord::Base
  validates :date, :presence => true
  validates :longitude, :presence => true
  validates :latitude, :presence => true
  belongs_to :animal
  belongs_to :region
end
