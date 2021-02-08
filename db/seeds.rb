Vehicle.create(code: 'DJ-3421')
Vehicle.create(code: 'EG-2384')
Vehicle.create(code: 'OC-2542')

Coordinate.create(
  latitude: '-80.675475',
  longitude: '-43.205394',
  sent_at: DateTime.parse('2020-06-03 20:45:00'),
  vehicle_id: Vehicle.find_by_code('OC-2542').id
)

Coordinate.create(
  latitude: '-33.4081785',
  longitude: '-70.5484857',
  sent_at: DateTime.parse('2020-06-03 20:45:00'),
  vehicle_id: Vehicle.find_by_code('EG-2384').id
)
