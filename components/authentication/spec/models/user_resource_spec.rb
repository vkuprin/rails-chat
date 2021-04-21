# frozen_string_literal: true

require "rails_helper"

RSpec.describe Authentication::UserResource, type: :model do
  context "Validation tests" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:resource_id) }
    it { should validate_presence_of(:resource_type) }
  end

  context "Associations tests" do
    it { should belong_to(:user) }
  end

  describe "Scopes", :aggregate_failures do
    context "type" do
      it "returns group messages" do
        group_message = create(:group_message)
        user = create(:user)

        user_resource = create(
          :user_resource,
          resource_type: Authentication::RESOURCE_TYPES[:group_message],
          resource_id:   group_message.id,
          user_id:       user.id
        )

        group_messages = described_class.group_messages

        expect(group_messages.first.id).to eq(user_resource.id)
        expect(group_messages.first.resource_id).to eq(user_resource.resource_id)
        expect(group_messages.first.resource_type).to eq(user_resource.resource_type)
        expect(group_messages.first.user_id).to eq(user_resource.user_id)
      end
    end
  end
end
