require 'rails_helper'

RSpec.describe Author, type: :model do

  before(:each) do
    @author = FactoryBot.create(:author)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@author).to be_a(Author)
      expect(@author).to be_valid
    end
  end

  ##first_name
  describe "first_name" do
    it "should not be missing" do
      bad_author = Author.create(first_name: "")
      expect(bad_author).not_to be_valid
      expect(bad_author.errors.include?(:first_name)).to eq(true)
    end
  end

  ##last_name
  describe "last_name" do
    it "should not be missing" do
      bad_author = Author.create(last_name: "")
      expect(bad_author).not_to be_valid
      expect(bad_author.errors.include?(:last_name)).to eq(true)
    end
  end

  ##biography
  describe "biography" do
    it "should not be missing" do
      bad_author = Author.create(biography: "")
      expect(bad_author).not_to be_valid
      expect(bad_author.errors.include?(:biography)).to eq(true)
    end
  end

  ##email
  describe "email" do
    it "should not be missing" do
      bad_author = Author.create(email: "")
      expect(bad_author).not_to be_valid
      expect(bad_author.errors.include?(:email)).to eq(true)
    end
  end

  describe "email" do
    it "should have a valid email format" do
      invalid_email_author = Author.create(email: "invalid-email") # Replace with an invalid email
      expect(invalid_email_author).not_to be_valid
      expect(invalid_email_author.errors.include?(:email)).to eq(true)
    end
  end

  context "associations" do

    describe "books" do
      it "should have many books" do
        book = FactoryBot.create(:book, author: @author)
        expect(@author.books.include?(book)).to eq(true)
      end
    end
  end
end
