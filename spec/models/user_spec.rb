require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_attributes(new_attributes = {})
    {
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name,
      email:      Faker::Internet.email,
      password:   Faker::Internet.password
    }.merge(new_attributes)
  end

  describe "validations" do
    it "requires an email" do
      user = User.new(valid_attributes(email: nil))
      expect(user).to be_invalid
    end
    it "requires first_name" do
      user = User.new(valid_attributes(first_name: nil))
      expect(user).to be_invalid
    end
    it  "requires last_name" do
      user = User.new
      user.valid?
      expect(user.errors.messages).to have_key(:last_name)
    end
    it "requires email with proper format" do
      user = User.new(valid_attributes(email: "test"))
      expect(user).to be_invalid
    end
  end

  describe "generating password_digest" do
    it "generates a password_digest upon saving" do
      u = User.new(valid_attributes)
      u.save
      expect(u.password_digest).to be
    end
  end

  describe ".full_name" do
    it "returns first name and last name concatentated" do
      attributes = valid_attributes
      u = User.new(attributes)
      expect(u.full_name).to eq("#{attributes[:first_name]} #{attributes[:last_name]}")
    end
  end
end
