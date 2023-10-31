# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Game.create(
# title: "Ironsworn",
# genre: "Dark fantasy",
# owner: "Shawn Tomkins"
# )


User.create(
  pseudo: "Alex",
  email: "runolf@hotmail.com",
  isadmin: true,
  created_at: Time.now,
  updated_at: Time.now,
  password: "Runolf"
)