class HomeController < ActionController::Base
  def show
    @vehicles = Vehicle.all

    @geojson = @vehicles.map do |vehicle|
      {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [
            vehicle.last_coordinates.latitude,
            vehicle.last_coordinates.longitude
          ]
        },
        properties: {
          name: vehicle.code,
          'marker-color': '#00607d',
          'marker-symbol': 'circle',
          'marker-size': 'medium'
        }
      }.to_json
    end
  end
end
