# frozen_string_literal: true

RSpec.describe Groups::CreateService, type: :service do
  context "when parameters are valid" do
    it "creates a new group" do
      params = {
        name: Faker::Lorem.word
      }

      expect do
        described_class.new(params).call
      end.to change(Chat::Group, :count).by(1)
    end
  end

  context "when parameters are invalid" do
    it "raises an exception" do
      expect do
        described_class.new({}).call
      end.to change(Chat::Group, :count).by(0)
    end
  end
end
