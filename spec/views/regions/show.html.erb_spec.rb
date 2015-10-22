require 'rails_helper'

RSpec.describe "regions/show", type: :view do
  before(:each) do
    @region = assign(:region, Region.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
