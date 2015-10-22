require 'rails_helper'

RSpec.describe "regions/index", type: :view do
  before(:each) do
    assign(:regions, [
      Region.create!(),
      Region.create!()
    ])
  end

  it "renders a list of regions" do
    render
  end
end
