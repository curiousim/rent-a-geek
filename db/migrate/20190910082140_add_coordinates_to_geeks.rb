class AddCoordinatesToGeeks < ActiveRecord::Migration[5.2]
  def change
    add_column :geeks, :latitude, :float
    add_column :geeks, :longitude, :float
  end
end
