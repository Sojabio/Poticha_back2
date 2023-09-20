require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:each) do
    @post = FactoryBot.create(:post)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@post).to be_a(Post)
      expect(@post).to be_valid
    end
  end

    ##title
    describe "title" do
      it "should not be missing" do
        bad_post = Post.create(title: "")
        expect(bad_post).not_to be_valid
        expect(bad_post.errors.include?(:title)).to eq(true)
      end
    end

    ##content
    describe "content" do
      it "should not be missing" do
        bad_post = Post.create(content: "")
        expect(bad_post).not_to be_valid
        expect(bad_post.errors.include?(:content)).to eq(true)
      end
    end

end
