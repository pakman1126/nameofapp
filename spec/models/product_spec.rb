require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike", description: "awesome bike", color: "blue", price: "99") }
    let(:user) { User.create!(first_name: "Jace", last_name: "Pak", email: "kidpakman@yahoo.com", password: "jacepak") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "OK bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq (3)
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice Bike")).not_to be_valid
    end

    it "is not valid without a price" do
      expect(Product.new(description: "Nice Bike")).not_to be_valid
    end
  end
end
