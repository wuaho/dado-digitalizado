require 'rails_helper'

RSpec.describe "/admin/tags", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tag.create! valid_attributes
      get admin_tags_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tag = Tag.create! valid_attributes
      get admin_tag_url(tag)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_tag_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      tag = Tag.create! valid_attributes
      get edit_admin_tag_url(tag)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::Tag" do
        expect {
          post admin_tags_url, params: { tag: valid_attributes }
        }.to change(Tag, :count).by(1)
      end

      it "redirects to the created admin_tag" do
        post admin_tags_url, params: { tag: valid_attributes }
        expect(response).to redirect_to(admin_tag_url(@admin_tag))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::Tag" do
        expect {
          post admin_tags_url, params: { tag: invalid_attributes }
        }.to change(Tag, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_tags_url, params: { tag: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_tag" do
        tag = Tag.create! valid_attributes
        patch admin_tag_url(admin_tag), params: { tag: new_attributes }
        tag.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_tag" do
        tag = Tag.create! valid_attributes
        patch admin_tag_url(admin_tag), params: { tag: new_attributes }
        tag.reload
        expect(response).to redirect_to(admin_tag_url(tag))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tag = Tag.create! valid_attributes
        patch admin_tag_url(admin_tag), params: { tag: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_tag" do
      tag = Tag.create! valid_attributes
      expect {
        delete admin_tag_url(admin_tag)
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the admin_tags list" do
      tag = Tag.create! valid_attributes
      delete admin_tag_url(admin_tag)
      expect(response).to redirect_to(admin_tags_url)
    end
  end
end
