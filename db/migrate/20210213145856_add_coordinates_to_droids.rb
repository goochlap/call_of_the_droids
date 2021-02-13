class AddCoordinatesToDroids < ActiveRecord::Migration[6.0]
  def change
    add_column :droids, :latitude, :float
    add_column :droids, :longitude, :float
  end
end
