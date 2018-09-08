# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 't4traw@gmail.com',
  name: 'たつろー',
  password: 'password',
  current_village: 1
)

User.create(
  email: 't4traw+foo@gmail.com',
  name: 'ふーさん',
  password: 'password',
  current_village: 1
)

User.create(
  email: 't4traw+bar@gmail.com',
  name: 'ばーさん',
  password: 'password',
  current_village: 1
)

Village.create(
  name: 'だいいちのむら',
  created_by: 1
)

Village.create(
  name: 'だいにのむら',
  created_by: 1
)

3.times do
  user = User.create(
    email: Faker::Internet.email,
    name: Faker::Internet.username,
    password: Faker::Internet.password(16)
  )
  VillageUser.create(
    user_id: user.id,
    village_id: 1
  )
end

