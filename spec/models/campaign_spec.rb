require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "validations" do
    it "requires a title" do
      c = Campaign.new
      c.valid?
      expect(c.errors.messages).to have_key(:title)
    end
    it "requires a goal" do
      c = Campaign.new
      c.valid?
      expect(c.errors.messages).to have_key(:goal)
    end
    it "requires a goal greater than 10" do
      c = Campaign.new(goal: 5)
      c.valid?
      expect(c.errors.messages).to have_key(:goal)
    end
  end
end
