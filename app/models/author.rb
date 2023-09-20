class Author < ApplicationRecord
  validates :first_name, :last_name, :biography, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :books
end
