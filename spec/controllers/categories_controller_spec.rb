require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe '#index' do
    subject{ get :index }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end
end
