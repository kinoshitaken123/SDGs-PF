# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@docomo.ne.jp',
  password: '123456'
   )

User.create!(
email: 'user@docomo.ne.jp',
  password: '123456',
  last_name: '花子',
  first_name: '山田',
  kana_last_name: 'ハナコ',
  kana_first_name: 'ヤマダ',
  phone_number: '09012345678'
  )