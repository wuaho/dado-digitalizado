require 'rails_helper'

RSpec.describe "/memberships", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Membership.create! valid_attributes
      get memberships_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      membership = Membership.create! valid_attributes
      get membership_url(membership)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_membership_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      membership = Membership.create! valid_attributes
      get edit_membership_url(membership)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Membership" do
        expect {
          post memberships_url, params: { membership: valid_attributes }
        }.to change(Membership, :count).by(1)
      end

      it "redirects to the created membership" do
        post memberships_url, params: { membership: valid_attributes }
        expect(response).to redirect_to(membership_url(Membership.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Membership" do
        expect {
          post memberships_url, params: { membership: invalid_attributes }
        }.to change(Membership, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post memberships_url, params: { membership: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested membership" do
        membership = Membership.create! valid_attributes
        patch membership_url(membership), params: { membership: new_attributes }
        membership.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the membership" do
        membership = Membership.create! valid_attributes
        patch membership_url(membership), params: { membership: new_attributes }
        membership.reload
        expect(response).to redirect_to(membership_url(membership))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        membership = Membership.create! valid_attributes
        patch membership_url(membership), params: { membership: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested membership" do
      membership = Membership.create! valid_attributes
      expect {
        delete membership_url(membership)
      }.to change(Membership, :count).by(-1)
    end

    it "redirects to the memberships list" do
      membership = Membership.create! valid_attributes
      delete membership_url(membership)
      expect(response).to redirect_to(memberships_url)
    end
  end
end
