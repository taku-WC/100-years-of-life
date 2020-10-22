# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  LevelSetting.create!(
    level: n-1,
    threshold: 3*n
  )
end

User.create(
  name: "guest",
  email: "guest1@guest1",
  password: "123456",
  profile: "ポートフォリオをご覧頂きありがとうございます。ご自由にお使いください。"
)