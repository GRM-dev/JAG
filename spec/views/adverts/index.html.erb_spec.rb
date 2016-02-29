require 'rails_helper'

RSpec.describe "adverts/index", type: :view do
  before(:each) do
    assign(:adverts, [
      Advert.create!(),
      Advert.create!()
    ])
  end

  it "renders a list of adverts" do
    render
  end
end
