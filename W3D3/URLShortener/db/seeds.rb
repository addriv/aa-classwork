# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user1 = User.create!(email: "me@me.com")
user2 = User.create!(email: "you@you.com")
user3 = User.create!(email: "somebody@somesite.com")

ShortenedUrl.destroy_all
url1 = ShortenedUrl.random_code("www.google.com", user1)
url2 = ShortenedUrl.random_code("www.github.com", user2)
url3 = ShortenedUrl.random_code("www.appacademy.io", user2)

Visit.destroy_all
visit1 = Visit.record_visit!(user1, url1)
visit2 = Visit.record_visit!(user1, url2)
visit3 = Visit.record_visit!(user1, url3)
visit4 = Visit.record_visit!(user2, url1)
visit5 = Visit.record_visit!(user2, url2)
visit6 = Visit.record_visit!(user3, url3)
