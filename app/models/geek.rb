class Geek < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  HOURS = ['One hour', 'Two hours', 'Three hours', 'Four hours', 'Five hours', 'Six hours']
end
