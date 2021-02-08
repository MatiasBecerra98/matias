# Home controller to show cars locations
class HomeController < ActionController::Base
  def show
    @vehicles = []
    Vehicle.all.each do |vehicle|
      next if vehicle.coordinates.empty?

      @vehicles << vehicle
    end

    @geojson = define_geoson(@vehicles)
  end

  def define_geoson(vehicles)
    vehicles.map do |vehicle|
      { type: 'Feature', geometry: { type: 'Point', coordinates: [
        vehicle.last_coordinates.latitude, vehicle.last_coordinates.longitude
      ] },
        properties: {
          name: vehicle.code,
          'marker-color': '#00607d',
          'marker-symbol': 'circle', 'marker-size': 'medium'
        } }.to_json
    end
  end
end
