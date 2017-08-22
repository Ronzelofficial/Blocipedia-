# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(6)
  )
  user.save!
end
users = User.all


25.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::RickAndMorty.character,
    body: Faker::RickAndMorty.quote
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
