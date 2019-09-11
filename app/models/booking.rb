class Booking < ApplicationRecord
  HOURS = ['One hour', 'Two hours', 'Three hours', 'Four hours', 'Five hours', 'Six hours']
  belongs_to :user
  belongs_to :geek
  validates :date, presence: true
  validates :time, presence: true
  validates :duration, presence: true, inclusion: { in: HOURS }
  validates :location, presence: true
end
