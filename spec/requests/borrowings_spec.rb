require 'rails_helper'

RSpec.describe '/borrowings', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Borrowing.create! valid_attributes
      get borrowings_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      borrowing = Borrowing.create! valid_attributes
      get borrowing_url(borrowing)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_borrowing_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      borrowing = Borrowing.create! valid_attributes
      get edit_borrowing_url(borrowing)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Borrowing' do
        expect do
          post borrowings_url, params: { borrowing: valid_attributes }
        end.to change(Borrowing, :count).by(1)
      end

      it 'redirects to the created borrowing' do
        post borrowings_url, params: { borrowing: valid_attributes }
        expect(response).to redirect_to(borrowing_url(Borrowing.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Borrowing' do
        expect do
          post borrowings_url, params: { borrowing: invalid_attributes }
        end.to change(Borrowing, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post borrowings_url, params: { borrowing: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested borrowing' do
        borrowing = Borrowing.create! valid_attributes
        patch borrowing_url(borrowing), params: { borrowing: new_attributes }
        borrowing.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the borrowing' do
        borrowing = Borrowing.create! valid_attributes
        patch borrowing_url(borrowing), params: { borrowing: new_attributes }
        borrowing.reload
        expect(response).to redirect_to(borrowing_url(borrowing))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        borrowing = Borrowing.create! valid_attributes
        patch borrowing_url(borrowing), params: { borrowing: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested borrowing' do
      borrowing = Borrowing.create! valid_attributes
      expect do
        delete borrowing_url(borrowing)
      end.to change(Borrowing, :count).by(-1)
    end

    it 'redirects to the borrowings list' do
      borrowing = Borrowing.create! valid_attributes
      delete borrowing_url(borrowing)
      expect(response).to redirect_to(borrowings_url)
    end
  end
end
