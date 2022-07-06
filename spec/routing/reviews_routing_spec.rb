require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/games/1/reviews').to route_to('reviews#index', game_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/games/1/reviews/new').to route_to('reviews#new', game_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/games/1/reviews/1').to route_to('reviews#show', game_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/games/1/reviews/1/edit').to route_to('reviews#edit', game_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/games/1/reviews').to route_to('reviews#create', game_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/games/1/reviews/1').to route_to('reviews#update', game_id: '1', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/games/1/reviews/1').to route_to('reviews#update', game_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/games/1/reviews/1').to route_to('reviews#destroy', game_id: '1', id: '1')
    end
  end
end
