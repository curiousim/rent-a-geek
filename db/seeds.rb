require 'faker'

puts "Cleaning geeks.."
Geek.delete_all
puts "Cleaning users.."
User.delete_all

##########################################################
#### FIRST TWO USERS TO GET ALL THE GEEKS ################
####       SO WE CAN LOGIN AFTER          ################
##########################################################

users = [
  {email: 'vpupkin@gmail.com', first_name: 'Vasya', last_name: 'Pupkin', password: '123456'},
  {email: 'jlennon@gmail.com', first_name: 'John', last_name: 'Lennon', password: '123456'}]

User.create!(users)

##########################################################
####        HOW MANY TIMES TO SEED        ################
####       and  FAKER MODELS TO SEED      ################
##########################################################

puts "Adding users..."
10.times do
  email = Faker::Internet.unique.email
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name

  User.create!(email: email, first_name: first_name, last_name: last_name, password: '123456')
end

puts "Adding geeks.."
categories = ["Sound Systems", "Security Systems", "VPN genius", "Linux specialist", "Math tutor", "Mathemagician","Physics tutor", "Biology tutoring", "Chemistry", "Geometry Brain"]
addresses = ["Ben Yehuda 32, Tel Aviv", "Rishon LeTsiyon", "Bnei Brak", "Ramat Gan", "Ashdod", "Sderot Ben Gurion, Haifa", "Hod HaSharon", "Ramat HaSharon", "Ramat Aviv", "Jabotinski St. 15, Givatayim"]
10.times do |i|
  category = categories[i]
  name = Faker::FunnyName.name
  description = Faker::Movies::HitchhikersGuideToTheGalaxy.quote
  location = addresses[i]
  price= Faker::Number.between(from: 5, to: 1000)

  Geek.create!(active: true, category: category, name: name, description: description, location: location, price: price, trusted: true, user: User.second)
end
