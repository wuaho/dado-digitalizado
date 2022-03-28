require 'rails_helper'

RSpec.describe "borrowings/new", type: :view do
  before(:each) do
    assign(:borrowing, Borrowing.new())
  end

  it "renders new borrowing form" do
    render

    assert_select "form[action=?][method=?]", borrowings_path, "post" do
    end
  end
end
