class AddFieldsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :content, :text
    add_column :bookings, :rating, :integer
  end
end
