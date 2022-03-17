require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      name: "MyString",
      description: "MyText",
      number_of_players: 1,
      language: 1,
      min_age: 1,
      brand: "MyString",
      stock: 1
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input[name=?]", "game[name]"

      assert_select "textarea[name=?]", "game[description]"

      assert_select "input[name=?]", "game[number_of_players]"

      assert_select "input[name=?]", "game[language]"

      assert_select "input[name=?]", "game[min_age]"

      assert_select "input[name=?]", "game[brand]"

      assert_select "input[name=?]", "game[stock]"
    end
  end
end
