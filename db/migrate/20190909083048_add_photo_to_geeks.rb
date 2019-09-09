class AddPhotoToGeeks < ActiveRecord::Migration[5.2]
  def change
    add_column :geeks, :photo, :string
  end
end
