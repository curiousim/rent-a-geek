class Geek < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  HOURS = ['One hour', 'Two hours', 'Three hours', 'Four hours', 'Five hours', 'Six hours']
end
