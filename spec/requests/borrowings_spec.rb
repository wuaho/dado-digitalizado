require 'rails_helper'
require 'support/controller_macros'
RSpec.describe '/borrowings', type: :request do
  before(:each) do
    @user = create(:user)
    @game = create(:game)
    sign_in @user
  end
  let(:valid_model_attributes) do
    {
      user: @user,
      game: @game,
      starts_on: Date.new(2022, 3, 28),
      expires_on: Date.new(2022, 10, 30)
    }
  end
  let(:valid_request_attributes) do
    {
      game_id: @game.id,
      starts_on: Date.new(2022, 3, 28),
      expires_on: Date.new(2022, 10, 30)
    }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Borrowing.create! valid_model_attributes
      get borrowings_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      borrowing = Borrowing.create! valid_model_attributes
      get borrowing_url(borrowing)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_borrowing_url(game_id: @game.id)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Borrowing' do
        expect do
          post borrowings_url, params: { borrowing: valid_request_attributes }
        end.to change(Borrowing, :count).by(1)
      end

      it 'redirects to the created borrowing' do
        post borrowings_url, params: { borrowing: valid_request_attributes }
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
end
