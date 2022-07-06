# require 'rails_helper'

# RSpec.describe "/games", type: :request do

#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }

#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }

#   describe "GET /index" do
#     it "renders a successful response" do
#       Game.create! valid_attributes
#       get games_url
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /show" do
#     it "renders a successful response" do
#       game = Game.create! valid_attributes
#       get game_url(game)
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /new" do
#     it "renders a successful response" do
#       get new_game_url
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /edit" do
#     it "render a successful response" do
#       game = Game.create! valid_attributes
#       get edit_game_url(game)
#       expect(response).to be_successful
#     end
#   end

#   describe "POST /create" do
#     context "with valid parameters" do
#       it "creates a new Game" do
#         expect {
#           post games_url, params: { game: valid_attributes }
#         }.to change(Game, :count).by(1)
#       end

#       it "redirects to the created game" do
#         post games_url, params: { game: valid_attributes }
#         expect(response).to redirect_to(game_url(Game.last))
#       end
#     end

#     context "with invalid parameters" do
#       it "does not create a new Game" do
#         expect {
#           post games_url, params: { game: invalid_attributes }
#         }.to change(Game, :count).by(0)
#       end

#       it "renders a successful response (i.e. to display the 'new' template)" do
#         post games_url, params: { game: invalid_attributes }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "PATCH /update" do
#     context "with valid parameters" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested game" do
#         game = Game.create! valid_attributes
#         patch game_url(game), params: { game: new_attributes }
#         game.reload
#         skip("Add assertions for updated state")
#       end

#       it "redirects to the game" do
#         game = Game.create! valid_attributes
#         patch game_url(game), params: { game: new_attributes }
#         game.reload
#         expect(response).to redirect_to(game_url(game))
#       end
#     end

#     context "with invalid parameters" do
#       it "renders a successful response (i.e. to display the 'edit' template)" do
#         game = Game.create! valid_attributes
#         patch game_url(game), params: { game: invalid_attributes }
#         expect(response).to be_successful
#       end
#     end
#   end

#   describe "DELETE /destroy" do
#     it "destroys the requested game" do
#       game = Game.create! valid_attributes
#       expect {
#         delete game_url(game)
#       }.to change(Game, :count).by(-1)
#     end

#     it "redirects to the games list" do
#       game = Game.create! valid_attributes
#       delete game_url(game)
#       expect(response).to redirect_to(games_url)
#     end
#   end
# end
