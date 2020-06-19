require 'rails_helper'

describe 'categories routes' do
  it 'should route to categories index' do
    expect(get: '/categories').to route_to('categories#index')
  end

  it 'should route to categories show' do
    expect(get: '/categories/1').to route_to('categories#show', id: '1')
  end

  it 'should route to categories create' do
    expect(post: 'categories').to route_to('categories#create')
  end

  it 'should route to categories update' do
    expect(patch: 'categories/1').to route_to('categories#update', id: '1')
    expect(put: 'categories/1').to route_to('categories#update', id: '1')
  end

  it 'should route to categories delete' do
    expect(delete: 'categories/1').to route_to('categories#destroy', id: '1')
  end
end
