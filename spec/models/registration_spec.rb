require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe 'associations' do
    it { should belong_to(:goodgymer) }
    it { should belong_to(:session) }
  end
end
