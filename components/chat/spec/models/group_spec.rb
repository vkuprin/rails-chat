# frozen_string_literal: true

require "rails_helper"

RSpec.describe Chat::GroupMessage, type: :model do
  context "Association tests" do
    it { should belong_to(:group) }
  end

  context "Validation tests" do
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:user_id) }
  end
end
