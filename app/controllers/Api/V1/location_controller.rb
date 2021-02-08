module Api
  module V1
    # LocationController for location params
    class LocationController < ApplicationController
      before_action :location_params

      def create
        if location_params
          CoordinateReceiverWorker.perform_async(location_params)
          render json: { success: 'Location created' }, status: :ok
        else
          render json: {
            error: 'Invalid body parameters'
          }, status: :bad_request
        end
      end

      private

      def location_params
        locations = params['location']

        return unless locations.key?('latitude')
        return unless locations.key?('longitude')
        return unless locations.key?('sent_at')
        return unless locations.key?('vehicle_identifier')

        locations
      end
    end
  end
end
