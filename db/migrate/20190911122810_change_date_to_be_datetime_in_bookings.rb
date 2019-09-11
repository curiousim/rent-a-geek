class ChangeDateToBeDatetimeInBookings < ActiveRecord::Migration[5.2]
  def change
    # change_column :bookings, :date, :datetime
    remove_column :bookings, :date
    add_column :bookings, :date, :datetime
  end
end
