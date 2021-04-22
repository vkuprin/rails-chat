# frozen_string_literal: true

RSpec.describe Groups::ShowService, type: :service do
  context "when parameters are valid" do
    it "returns a group" do
      group = create(:group)
      show_service = described_class.new(group.id).call

      expect(show_service.id).to eq(group.id)
    end
  end

  context "when parameters are invalid" do
    it "does not return a group" do
      expect do
        described_class.new(213).call
      end.to raise_error
    end
  end
end
