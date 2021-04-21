# frozen_string_literal: true

require "rails_helper"

RSpec.describe Groups::ShowService, type: :service do
  context "when parameters are valid" do
    it "returns a group" do
      group = create(:group)
      show_service = described_class.new.call(group.id)

      expect(show_service.id).to eq(group.id)
    end
  end

  context "when parameters are invalid" do
    it "does not return a group" do
      expect do
        described_class.new.call(213)
      end.to raise_error
    end
  end
end
