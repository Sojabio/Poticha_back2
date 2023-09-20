require 'rails_helper'

RSpec.describe Contact, type: :model do

  before(:each) do
    @contact = FactoryBot.create(:contact)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@contact).to be_a(Contact)
      expect(@contact).to be_valid
    end
  end

  ##name
  describe "name" do
    it "should not be missing" do
      bad_contact = Contact.create(name: "")
      expect(bad_contact).not_to be_valid
      expect(bad_contact.errors.include?(:name)).to eq(true)
    end
  end

  ##email
  describe "email" do
    it "should not be missing" do
      bad_contact = Contact.create(email: "")
      expect(bad_contact).not_to be_valid
      expect(bad_contact.errors.include?(:email)).to eq(true)
    end
  end

  ##subject
  describe "subject" do
    it "should not be missing" do
      bad_contact = Contact.create(subject: "")
      expect(bad_contact).not_to be_valid
      expect(bad_contact.errors.include?(:subject)).to eq(true)
    end
  end

  ##message
  describe "message" do
    it "should not be missing" do
      bad_contact = Contact.create(message: "")
      expect(bad_contact).not_to be_valid
      expect(bad_contact.errors.include?(:message)).to eq(true)
    end
  end
end
