# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Groups", type: :request do
  include_context "with authenticated user"

  describe "GET /api/chat/groups" do
    context "when parameters are valid", :aggregate_failures do
      it "returns 201" do
        create(:group)

        get "/api/chat/groups", params: {}, headers: headers(response)

        expect(response.status).to eq(200)
        expect(json_response["groups"].count).to eq(1)
      end
    end
  end

  describe "GET /api/chat/groups/:id" do
    context "when parameters are valid", :aggregate_failures do
      it "returns 201" do
        group = create(:group)
        create_list(:group_message, 3, group: group, user_id: user.id)

        get "/api/chat/groups/#{group.id}", headers: headers(response)

        expect(response.status).to eq(200)
        expect(json_response["id"]).to eq(group.id)
        expect(json_response["name"]).to eq(group.name)
        expect(json_response["messages"].count).to eq(3)
      end
    end

    context "when parameters are invalid" do
      it "returns 404" do
        get "/api/chat/groups/321", headers: headers(response)

        expect(response.status).to eq(404)
      end
    end
  end

  describe "POST /api/chat/groups" do
    context "when parameters are valid" do
      let(:params) do
        {
          group: {
            name: Faker::Lorem.word
          }
        }
      end

      it "returns 201" do
        post "/api/chat/groups", params: params, headers: headers(response)

        expect(response.status).to eq(201)
      end

      it "adds group successfully" do
        expect do
          post "/api/chat/groups", params: params, headers: headers(response)
        end.to change(Chat::Group, :count).by(1)
      end
    end
  end

  context "when parameters are invalid" do
    let(:params) do
      {}
    end

    it "returns 422" do
      post "/api/chat/groups", params: params, headers: headers(response)

      expect(response.status).to eq(422)
    end
  end

  context "when user is not authenticated" do
    it "returns 401" do
      get "/api/chat/groups", params: {}

      expect(response.status).to eq(401)
    end
  end
end
