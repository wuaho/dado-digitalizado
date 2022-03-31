require 'rails_helper'

RSpec.describe "memberships/edit", type: :view do
  before(:each) do
    @membership = assign(:membership, Membership.create!(
      active: false,
      user: nil
    ))
  end

  it "renders the edit membership form" do
    render

    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do

      assert_select "input[name=?]", "membership[active]"

      assert_select "input[name=?]", "membership[user_id]"
    end
  end
end
