class Animal < ActiveRecord::Base
  validates :name, :presence => true
  has_many :sightings
  accepts_nested_attributes_for :sightings
end
