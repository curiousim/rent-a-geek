class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :geeks, dependent: :destroy
  # has_many :geeks, through: :reviews
  has_many :geeks
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
