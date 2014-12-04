create_account = User.create([email: "example@gmail.com", password: "12345678", password_confirmation: "12345678", name: "測試用帳號"])

i = 1..20
k = 1..30

create_groups = i.each do
                  Group.create!([title: "Group no.#{i}", description: "這是用種子建立的第 #{i} 個討論版", user_id: "1"])
                  k.each do
                    Post.create!([group_id: "#{i}", content: "這是用種子建立的第 #{k} 個留言", user_id: "1"])
                  end
                end # rubocop:disable Lint/BlockAlignment

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
