# spec/requests/registrations_spec.rb
require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /registrations" do
    let(:goodgymer) { Goodgymer.create(name: 'John Doe', area_id: 1, role: 'TaskForce', dbs_verified: true) }
    let(:session) { Session.create(name: 'Community Mission', area_id: 1, registration_limit: 10, session_type: 'CommunityMission') }

    context "when the goodgymer can register" do
      it "creates a new registration" do
        post registrations_path, params: { registration: { goodgymer_id: goodgymer.id, session_id: session.id } }
        expect(response).to have_http_status(:created)
      end
    end

    context "when the goodgymer cannot register" do
      let(:goodgymer) { Goodgymer.create(name: 'John Doe', area_id: 1, role: 'Regular', dbs_verified: true) }

      it "returns a forbidden status" do
        post registrations_path, params: { registration: { goodgymer_id: goodgymer.id, session_id: session.id } }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
