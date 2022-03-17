require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        name: "Name",
        description: "MyText",
        number_of_players: 2,
        language: 3,
        min_age: 4,
        brand: "Brand",
        stock: 5
      ),
      Game.create!(
        name: "Name",
        description: "MyText",
        number_of_players: 2,
        language: 3,
        min_age: 4,
        brand: "Brand",
        stock: 5
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Brand".to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
  end
end
