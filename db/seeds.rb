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


authors = 10.times.map do
  Author.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    biography: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    email: "author@test.fr"
  )
end

authors.each_with_index do |author, index|
  Book.create!(
    title: Faker::Book.title,
    description: Faker::Books::Lovecraft.paragraph,
    ISBN: "PLOUPISBN123456",
    season: rand(1..2),
    pages: rand(25..150),
    author_id: author.id,
  )
end

10.times do
  Post.create!(
    title: Faker::Adjective.positive,
    content: Faker::Fantasy::Tolkien.poem,
  )
end
