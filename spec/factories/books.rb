FactoryBot.define do
  factory :book do
    title { "Titre" }
    description { "Bio" }
    ISBN { "1234567891234" }
    issue_date {'2023-09-20 14:37:59'}
    season {2 }
    pages { 13 }
    association :author, factory: :author
  end
end
