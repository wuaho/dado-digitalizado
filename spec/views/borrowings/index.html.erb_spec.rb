require 'rails_helper'

RSpec.describe "borrowings/index", type: :view do
  before(:each) do
    assign(:borrowings, [
      Borrowing.create!(),
      Borrowing.create!()
    ])
  end

  it "renders a list of borrowings" do
    render
  end
end
