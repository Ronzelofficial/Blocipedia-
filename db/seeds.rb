
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(6),
    role: "standard"
  )
  user.save!
end

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(6),
    role: "premium"
  )
  user.save!
end

user = User.new(
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(6),
  role: "admin"
)
user.save!

users = User.all



25.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
