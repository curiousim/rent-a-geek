class Geek < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings, dependent: :destroy
end
