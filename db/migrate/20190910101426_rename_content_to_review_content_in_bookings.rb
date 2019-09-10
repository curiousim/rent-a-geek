class RenameContentToReviewContentInBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :content, :review_content
  end
end
