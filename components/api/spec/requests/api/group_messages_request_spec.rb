# frozen_string_literal: true

RSpec.describe "Groups Messages", type: :request do
  include_context "with authenticated user"

  describe "POST /api/chat/group_messages" do
    context "when parameters are valid" do
      let(:group) { create(:group) }
      let(:params) do
        {
          group_message: {
            message:  Faker::Lorem.word,
            group_id: group.id
          }
        }
      end

      it "returns 201" do
        allow(Redis).to receive(:publish)

        post "/api/chat/group_messages", params: params, headers: headers(response)

        expect(response.status).to eq(201)
      end

      it "adds message successfully" do
        allow(Redis).to receive(:publish)
        expect do
          post "/api/chat/group_messages", params: params, headers: headers(response)
        end.to change(Chat::GroupMessage, :count)
          .by(1)
          .and change(Authentication::UserResource, :count)
          .by(1)
      end
    end
  end

  context "when parameters are invalid" do
    let(:params) do
      {}
    end

    it "returns 422" do
      post "/api/chat/group_messages", params: params, headers: headers(response)

      expect(response.status).to eq(422)
    end
  end

  context "when user is not authenticated" do
    it "returns 401" do
      post "/api/chat/group_messages", params: {}

      expect(response.status).to eq(401)
    end
  end
end
