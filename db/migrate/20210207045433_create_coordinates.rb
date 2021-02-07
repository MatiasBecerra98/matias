class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.references :vehicle
      t.float :latitude
      t.float :longitude
      t.datetime :sent_at

      t.timestamps
    end
  end
end
