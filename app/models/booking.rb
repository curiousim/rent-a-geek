class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :geek
  #validates :date, presence: true
  #validates :time, presence: true
  validates :duration, presence: true
  validates :address, presence: true
end
