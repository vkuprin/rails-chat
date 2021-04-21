# frozen_string_literal: true

RSpec.describe "POST /api/users", type: :request do
  let(:url) { "/api/users" }
  let(:password) { "Passw0rd" }
  let(:password_confirmation) { "Passw0rd" }
  let(:params) do
    {
      email:                 Faker::Internet.email,
      password:              password,
      password_confirmation: password_confirmation
    }
  end
  let(:request) { post url, params: params }

  context "when user is unauthenticated" do
    it "returns successful response", :aggregate_failures do
      expect do
        request
      end.to change(Authentication::User, :count).by(1)
                                                 .and change(Authentication::UserResource, :count).by(1)
    end
  end

  context "when email is already taken" do
    before do
      create(:user, email: params[:email])
      request
    end

    it "returns bad request status", :aggregate_failures do
      expect(response.status).to eq 422

      expect(json_response.first["code"]).to eq(42_201)
      expect(json_response.first["title"]).to eq("Invalid parameters")
      expect(json_response.first["status"]).to eq(422)
    end
  end

  context "with empty email" do
    let(:params) do
      {}
    end

    before { request }

    it "returns bad request status", :aggregate_failures do
      expect(response.status).to eq 422
      expect(json_response.first["code"]).to eq(42_201)
      expect(json_response.first["title"]).to eq("Validation failed: Email can't be blank")
      expect(json_response.first["status"]).to eq(422)
    end
  end
end
