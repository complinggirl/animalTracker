require '../rails_helper'

describe Region do
  it "should validate the presence of a name" do
    name = Region.new({:name => '' })
    expect(name.save).to eq false
  end

  it "it should have sightings" do
    west = Region.create({:name => "west"})
    sighting = Sighting.create({:date => "2010/09/09", :longitude => 24.5, :latitude => 23.8})
    west.sightings << sighting
    expect(sighting.region).to eq west
  end

end
