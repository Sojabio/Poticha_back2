Property.destroy_all
User.destroy_all

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123456",
    is_admin: false
  )
end

1.times do
  User.create!(
    email: "admin@test.fr",
    password: "azerty",
    is_admin: true
  )
end

1.times do
  User.create!(
    email: "user@test.fr",
    password: "azerty",
    is_admin: false
  )
end

10.times do
  Property.create!(
    title: Faker::Book.title,
    price: rand(100000...1000000000),
    description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    user_id: rand(User.first.id..User.last.id)
  )
end
