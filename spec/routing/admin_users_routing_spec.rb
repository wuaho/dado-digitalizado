require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/users').to route_to('admin/users#index')
    end

    it 'doesn\'t route to #new' do
      expect(get: 'admin/users/new').not_to route_to('admin/users#new')
    end

    it 'routes to #show' do
      expect(get: 'admin/users/1').to route_to('admin/users#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: 'admin/users/1/edit').to route_to('admin/users#edit', id: '1')
    end

    it 'doesn\'t route to #create' do
      expect(post: 'admin/users').not_to route_to('admin/users#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'admin/users/1').to route_to('admin/users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'admin/users/1').to route_to('admin/users#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'admin/users/1').to route_to('admin/users#destroy', id: '1')
    end

    it 'routes to #ban' do
      expect(patch: 'admin/users/1/ban').to route_to('admin/users#ban', id: '1')
    end
  end
end
