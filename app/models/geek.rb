class Geek < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  HOURS = ['One hour', 'Two hours', 'Three hours', 'Four hours', 'Five hours', 'Six hours']
end
