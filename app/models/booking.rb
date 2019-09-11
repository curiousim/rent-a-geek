class Booking < ApplicationRecord
  HOURS = [1, 2, 3, 4, 5, 6]
  belongs_to :user
  belongs_to :geek
  validates :date, presence: true
  # validates :time, presence: true
  validates :duration, presence: true, inclusion: { in: HOURS }
  validates :address, presence: true
end
