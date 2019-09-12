class AddDefaultValueToBookingDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :date
    add_column :bookings, :date, :datetime, default: Time.now
  end
end
