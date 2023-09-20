class Book < ApplicationRecord
  validates :title, :description, :issue_date, presence: true
  validates :ISBN, presence: true, format: { with: /\A\d{13}\z/, message: "doit être composé de 13 chiffres" }
  validates :pages, :season, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  belongs_to :author
end
