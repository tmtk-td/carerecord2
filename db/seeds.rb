# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Label.create!(
#    title: "入浴済み"
# )
# Label.create!(
#    title: "体操参加"
# )

# 5.times do |n|
#       Client.create!(
#         name: "男性利用者sample#{n + 1}",
#         sex: "男性",
#         image: File.open('./app/assets/images/m_e_others_501.png')
#       )
#    end

10.times do |n|
   Client.create!(
      name: "女性利用者sample#{n + 1}",
      sex: "女性",
      image: File.open('./app/assets/images/m_e_others_501.png')
   )
end   
   