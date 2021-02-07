class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :code

      t.timestamps
    end
  end
end
