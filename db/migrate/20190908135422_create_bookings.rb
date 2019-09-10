class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :geek, foreign_key: true
      t.integer :date
      t.integer :time
      t.string :address
      t.string :content
      t.integer :duration

      t.timestamps
    end
  end
end
