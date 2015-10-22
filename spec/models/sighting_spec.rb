require '../rails_helper'

describe Sighting do
  it "should validate the presence of a date, longitude, latitude" do
    sighting = Sighting.create({:date => "2010/09/09", :longitude => 24.5, :latitude => 23.8})
    expect(sighting.save).to eq true
  end

  it "should validate the presence of a date, longitude, latitude" do
    sighting = Sighting.create({:date => "2010/09/09", :longitude => 24.5})
    expect(sighting.save).to eq false
  end

  it "it should belong to an animal" do
    zebra = Animal.create({:name => "zebra"})
    a = Sighting.create({:date => "2010/09/09", :longitude => 24.5, :latitude => 23.8})
    zebra.sightings << a
    expect(a.animal).to eq zebra
  end

end
