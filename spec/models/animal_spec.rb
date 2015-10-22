require '../rails_helper'

describe Animal do
  it "should validate the presence of a name" do
    animal_name = Animal.new({:name => '' })
    expect(animal_name.save).to eq false
  end

  it "it should have a sighting" do
    zebra = Animal.create({:name => "zebra"})
    sighting = Sighting.create({:date => "2010/09/09", :longitude => 24.5, :latitude => 23.8})
    zebra.sightings << sighting
    expect(sighting.animal).to eq zebra
  end

end
