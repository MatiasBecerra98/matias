require 'sidekiq'

# Coordinate Worker manage calls to create new records
class CoordinateReceiverWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'create-queue'

  def perform(coordinates_params)
    vehicle = Vehicle.find_or_create_by(
      code: coordinates_params['vehicle_identifier']
    )

    Coordinate.create(latitude: coordinates_params['latitude'],
                      longitude: coordinates_params['longitude'],
                      sent_at: DateTime.parse(coordinates_params['sent_at']),
                      vehicle_id: vehicle.id)
  end
end
