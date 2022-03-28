require 'rails_helper'

RSpec.describe "borrowings/show", type: :view do
  before(:each) do
    @borrowing = assign(:borrowing, Borrowing.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
