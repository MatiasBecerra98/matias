module Api
  module V1
    # LocationController for location params
    class LocationController < ApplicationController
      before_action :location_params

      def create
        if location_params.permitted?
          CoordinateReceiverWorker.perform_async(location_params.to_hash)
          head :ok, content_type: 'text/html'
        else
          render json: { error: location_params[:location] }
        end
      end

      private

      def location_params
        params.require(:location).permit(:latitude,
                                         :longitude,
                                         :sent_at,
                                         :vehicle_identifier)
      end
    end
  end
end
