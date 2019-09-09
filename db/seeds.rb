# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# IgorZ version

puts "Cleaning geeks.."
Geek.delete_all
puts "Cleaning users.."
User.delete_all

puts "Add some users.."

users = [
  {email: 'vpupkin@gmail.com', first_name: 'Vasya', last_name: 'Pupkin', password: '123456'},
  {email: 'jlennon@gmail.com', first_name: 'John', last_name: 'Lennon', password: '123456'}]

# url = "https://res.cloudinary.com/dfqbormfp/image/upload/v1567853147/wa9vlnulrm72empij7o3.jpg"
# user = User.create(email: 'fictive1@gmial.com', first_name: 'Vasya', last_name: 'Pupkin', password: '12345')
# user.remote_photo_url = url

User.create!(users)

puts "Add some geeks.."

geeks = [
  { category: 'Compute', name: 'Vasya the Beast', description: 'Lorem ipsum dolor sit amet', location: 'Tel Aviv', price: 300, active: true, trusted: true, user: User.first},
  { category: 'Chemistry', name: 'John the Fox', description: 'Lorem ipsum dolor sit amet', location: 'London', price: 500, active: true, trusted: true, user: User.second},
  { active: true, name: 'Moshe Ben Yosef', description: "Ahi, naase leha buba!", location: 'Bat Yam', price: 15, trusted: true, user: User.second, category: "Instalyator" }
]
Geek.create!(geeks)
