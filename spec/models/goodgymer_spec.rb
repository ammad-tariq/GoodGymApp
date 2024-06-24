require 'rails_helper'

RSpec.describe Goodgymer, type: :model do
  describe 'associations' do
    it { should have_many(:registrations) }
    it { should have_many(:sessions).through(:registrations) }
    it { should have_many(:pairings) }
  end

  describe 'enums' do
    it { should define_enum_for(:role).with_values([:Regular, :TaskForce]) }
  end
end
