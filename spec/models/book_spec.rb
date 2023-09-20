require 'rails_helper'

RSpec.describe Book, type: :model do

  before(:each) do
    @book = FactoryBot.create(:book)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@book).to be_a(Book)
      expect(@book).to be_valid
    end
  end

    ##title
    describe "title" do
      it "should not be missing" do
        bad_book = Book.create(title: "")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:title)).to eq(true)
      end
    end

    ##description
    describe "description" do
      it "should not be missing" do
        bad_book = Book.create(description: "")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:description)).to eq(true)
      end
    end

    ##issue_date
    describe "issue_date" do
      it "should not be missing" do
        bad_book = Book.create(issue_date: "")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:issue_date)).to eq(true)
      end
    end

    ##pages
    describe "pages" do
      it "should not be missing" do
        bad_book = Book.create(pages: "")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:pages)).to eq(true)
      end
    end

    describe "pages" do
      it "should be an integer" do
        bad_book = Book.create(pages: "bb")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:pages)).to eq(true)
      end
    end

    describe "pages" do
      it "should be greater than 0" do
        bad_book = Book.create(pages: -1)
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:pages)).to eq(true)
      end
    end

    ##season
    describe "season" do
      it "should not be missing" do
        bad_book = Book.create(pages: "")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:season)).to eq(true)
      end
    end

    describe "season" do
      it "should be an integer" do
        bad_book = Book.create(pages: "bb")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:season)).to eq(true)
      end
    end

    describe "season" do
      it "should be greater than 0" do
        bad_book = Book.create(pages: -2)
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:season)).to eq(true)
      end
    end

    #ISBN
    describe "ISBN" do
      it "should not be missing" do
        bad_book = Book.create(ISBN:"")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:ISBN)).to eq(true)
      end
    end

    describe "ISBN" do
      it "should not be more than 13 number" do
        bad_book = Book.create(ISBN:"1234567891234567")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:ISBN)).to eq(true)
      end
    end

    describe "ISBN" do
      it "should not be less than 13 number" do
        bad_book = Book.create(ISBN:"123")
        expect(bad_book).not_to be_valid
        expect(bad_book.errors.include?(:ISBN)).to eq(true)
      end
    end

  context "associations" do

    describe "book" do
      it "should belong to one author" do
        author = FactoryBot.create(:author)
        book =  FactoryBot.create(:book, author: author)
        expect(book.author).to eq(author)
      end
    end

  end
end
