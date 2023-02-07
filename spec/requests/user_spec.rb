require 'rails_helper'

RSpec.describe User, type: :request do
  context 'Testing /users route' do
    before(:each) do
      get '/users'
    end
    it 'response status correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'response status not incorrect' do
      expect(response).not_to have_http_status(:not_found)
    end
    it 'response renders index mehtod' do
      expect(response).to render_template(:index)
    end
    it 'response not renders show method' do
      expect(response).not_to render_template(:show)
    end
  end

  context 'Testing /users/:id route' do
    before(:each) do
      get '/users/1'
    end
    it 'response status correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'response status not incorrect' do
      expect(response).not_to have_http_status(:not_found)
    end
    it 'response renders index mehtod' do
      expect(response).to render_template(:show)
    end
    it 'response not renders show method' do
      expect(response).not_to render_template(:index)
    end
  end
end