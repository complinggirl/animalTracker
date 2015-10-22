require 'rails_helper'

RSpec.describe "sightings/show", type: :view do
  before(:each) do
    @sighting = assign(:sighting, Sighting.create!(
      :longitude => 1.5,
      :latitude => 1.5,
      :date => "Date",
      :date => "Date"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Date/)
    expect(rendered).to match(/Date/)
  end
end
