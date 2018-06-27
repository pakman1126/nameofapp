require 'rails_helper'

describe Order do
  context "testing validations" do

    it "requires email address" do
      expect(User.new(first_name: "Jace", last_name: "Pak", email: nil)).not_to be_valid
    end
  end
end
