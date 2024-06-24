# spec/requests/goodgymers_spec.rb
require 'rails_helper'

RSpec.describe "Goodgymers", type: :request do
  describe "GET /goodgymers" do
    it "returns a list of goodgymers" do
      get goodgymers_path
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET /goodgymers/:id" do
    let(:goodgymer) { Goodgymer.create(name: 'John Doe', area_id: 1, role: 'TaskForce', dbs_verified: true) }

    it "returns the goodgymer" do
      get goodgymer_path(goodgymer)
      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "POST /goodgymers" do
    it "creates a new goodgymer" do
      post goodgymers_path, params: { goodgymer: { name: 'John Doe', area_id: 1, role: 'TaskForce', dbs_verified: true } }
      expect(response).to have_http_status(:created)
    end
  end
end
