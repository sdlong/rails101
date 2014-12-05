User.create([email: "example@gmail.com", password: "12345678", password_confirmation: "12345678", name: "測試用帳號"])

for i in 1..20 do # rubocop:disable Style/For
  Group.create!([title: "Group no.#{i}", description: "這是用種子建立的第 #{i} 個討論版", user_id: "1"])
  for k in 1..30 do # rubocop:disable Style/For
    Post.create!([group_id: "#{i}", content: "這是用種子建立的第 #{k} 個留言", user_id: "1"])
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
