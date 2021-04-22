# frozen_string_literal: true

RSpec.describe Chat::Group, type: :model do
  context "Association tests" do
    it { should have_many(:group_messages) }
  end

  context "Validation tests" do
    it { should validate_presence_of(:name) }
  end
end
