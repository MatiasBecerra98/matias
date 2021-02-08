require 'rails_helper'

RSpec.describe Api::V1::LocationController, type: :controller do
  describe 'Test for location controller' do
    it 'return 200' do
      params = { location: {
        latitude: '-80.675475',
        longitude: '-43.205394',
        sent_at: '2020-06-03 20:45:00',
        vehicle_identifier: 'DF-3432'
      } }

      post :create, params: params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(
        { 'success': 'Location created' }.deep_stringify_keys
      )
    end

    it 'return 400' do
      params = { location: {
        plane: 'invalid'
      } }

      post :create, params: params

      expect(response).to have_http_status(:bad_request)
    end
  end
end
