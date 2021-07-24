# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
#   email: 'admin2@docomo.ne.jp',
#   password: '123456',
#   name: '山田太郎'
#   )

User.create!(
  email: 'hanako@docomo.ne.jp',
  password: '123456',
  last_name: '山田',
  first_name: '花子',
  kana_last_name: 'ヤマダ',
  kana_first_name: 'ハナコ',
  phone_number: '09012345678'
  )