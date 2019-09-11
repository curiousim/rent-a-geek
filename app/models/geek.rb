class Geek < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  CATEGORIES = ['Coding', 'Cuddles', 'Star Wars', 'Linux Administration', 'Windows administration', 'Hardware', 'Mobile phones', 'Comics', 'GoT whining', 'Heroku', 'RoR', 'General Geekery', 'Beardnecks', 'Manga', 'Cyber security', 'DevOps', "Sound Systems", "Security Systems", "VPN genius", "Math tutor", "Mathemagician","Physics tutor", "Biology tutoring", "Chemistry", "Geometry Brain" ]
  HOURS = ['One hour', 'Two hours', 'Three hours', 'Four hours', 'Five hours', 'Six hours']
end
