# frozen_string_literal: true

require "rails_helper"

RSpec.describe Groups::ListService, type: :service do
  context "when parameters are valid" do
    it "returns a list of groups" do
      create_list(:group, 4)

      expect(described_class.new.call.count).to eq(4)
    end
  end
end
