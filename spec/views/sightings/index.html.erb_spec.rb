require 'rails_helper'

RSpec.describe "sightings/index", type: :view do
  before(:each) do
    assign(:sightings, [
      Sighting.create!(
        :longitude => 1.5,
        :latitude => 1.5,
        :date => "Date",
        :date => "Date"
      ),
      Sighting.create!(
        :longitude => 1.5,
        :latitude => 1.5,
        :date => "Date",
        :date => "Date"
      )
    ])
  end

  it "renders a list of sightings" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
    assert_select "tr>td", :text => "Date".to_s, :count => 2
  end
end
