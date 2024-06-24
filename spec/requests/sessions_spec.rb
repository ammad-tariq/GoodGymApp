require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /sessions" do
    it "returns a list of sessions" do
      get sessions_path, headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /sessions/:id" do
    let(:session) { Session.create(name: "Test Session", area_id: 1, registration_limit: 10, session_type: :CommunityMission) }

    it "returns the session" do
      get session_path(session), headers: { "ACCEPT" => "application/json" }
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "POST /sessions" do
    it "creates a new session" do
      expect {
        post sessions_path, params: { session: { name: "New Session", area_id: 1, registration_limit: 10, session_type: :CommunityMission } }, headers: { "ACCEPT" => "application/json" }
      }.to change(Session, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end
end
