Countdown.destroy_all
Post.destroy_all
Author.destroy_all
Book.destroy_all
User.destroy_all


1.times do
  User.create!(
    email: "admin@test.fr",
    password: "azerty",
  )
end


# authors = 10.times.map do
#   Author.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     biography: Faker::Quotes::Shakespeare.king_richard_iii_quote,
#     email: "author@test.fr"
#   )
# end

# authors.each_with_index do |author, index|
#   Book.create!(
#     title: Faker::Book.title,
#     description: Faker::Books::Lovecraft.paragraph,
#     ISBN: "1234567891234",
#     season: rand(1..2),
#     pages: rand(25..150),
#     issue_date: Faker::Time.backward(days: 600, period: :evening),
#     author_id: author.id,
#   )
# end

# 10.times do
#   Post.create!(
#     title: Faker::Adjective.positive,
#     content: Faker::Fantasy::Tolkien.poem,
#   )
# end

# 1.times do
#   Countdown.create!(
#     start_date: DateTime.strptime("14/09/2023 8:00", "%d/%m/%Y %H:%M"),
#     end_date: DateTime.strptime("25/10/2023 8:00", "%d/%m/%Y %H:%M"),
#     is_open: false
#   )
# end
