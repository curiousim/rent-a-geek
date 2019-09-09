# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts "Cleaning users.."
# User.delete_all

# puts "Add some users.."

# url = "https://res.cloudinary.com/dfqbormfp/image/upload/v1567853147/wa9vlnulrm72empij7o3.jpg"
# user = User.create(email: 'fictive1@gmial.com', first_name: 'Vasya', last_name: 'Pupkin', password: '12345')
# user.remote_avatar_url = url
# user.save!

User.create!(email: 'fictive1@gmial.com', first_name: 'Vasya', last_name: 'Pupkin', password: '123456')
Geek.create!(active: true, name: 'Pupkin Vasilius', description: "Good at drinking beer, can code, can't not code.", location: 'Tel Aviv', price: 12, trusted: true, user_id: 1, category: "Beer Drinker")
Geek.create!(active: true, name: 'Moshe Ben Yosef', description: "Ahi, naase leha buba!", location: 'Bat Yam', price: 15, trusted: true, user_id: 1, category: "Instalyator")
Geek.create!(active: true, name: 'Barbara Wolf', description: "Back-end specialist", location: 'Herzliya', price: 25, trusted: true, user_id: 1, category: "Engineer")