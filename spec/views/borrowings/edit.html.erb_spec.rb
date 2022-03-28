require 'rails_helper'

RSpec.describe "borrowings/edit", type: :view do
  before(:each) do
    @borrowing = assign(:borrowing, Borrowing.create!())
  end

  it "renders the edit borrowing form" do
    render

    assert_select "form[action=?][method=?]", borrowing_path(@borrowing), "post" do
    end
  end
end
