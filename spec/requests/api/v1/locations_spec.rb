require 'swagger_helper'

RSpec.describe 'api/v1/locations', type: :request do
  path '/api/v1/gps' do
    post 'Create a new Vehicle Location' do
      tags 'Vehicle Locations'
      consumes 'application/json'
      parameter name: :location, in: :body, schema: {
        type: :object,
        properties: {
          latitude: { type: :string },
          longitude: { type: :string },
          sent_at: { type: :string },
          vehicle_identifier: { type: :string }
        },
        required: %w[latitude longitude sent_at vehicle_identifier]
      }
      response '204', 'location created' do
        let(:location) do
          {
            latitude: '-80.675475',
            longitude: '-43.205394',
            sent_at: '2020-06-03 20:45:00',
            vehicle_identifier: 'DF-3432'
          }
        end
        run_test!
      end
    end
  end
end
