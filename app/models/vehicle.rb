# Vehicle class to manage creation
class Vehicle < ApplicationRecord
  has_many :coordinates

  validates_presence_of :code

  def last_coordinates
    coordinates.order(:sent_at).last
  end
end
