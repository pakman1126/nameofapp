require 'rails_helper'

describe Comment do
  context "testing validations" do

    it "is not valid without a rating" do
      expect(Comment.new(rating:nil)).not_to be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(body:nil)).not_to be_valid
    end

    it "is not valid without a user" do
      expect(Comment.new(user:nil)).not_to be_valid
    end

    it "is not valid without a product" do
      expect(Comment.new(product:nil)).not_to be_valid
    end
  end
end
