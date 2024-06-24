require 'rails_helper'

RSpec.describe Session, type: :model do
  describe 'associations' do
    it { should have_many(:registrations) }
    it { should have_many(:goodgymers).through(:registrations) }
    it { should have_many(:pairings) }
  end

  describe 'enums' do
    it { should define_enum_for(:session_type).with_values([:CommunityMission, :SocialVisit, :GroupRun]) }
  end
end
