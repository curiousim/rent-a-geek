class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :geek
  validates :date, presence: true
end
