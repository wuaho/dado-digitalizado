require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      name: "Name",
      description: "MyText",
      number_of_players: 2,
      language: 3,
      min_age: 4,
      brand: "Brand",
      stock: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/5/)
  end
end
