class Session < ApplicationRecord
  has_many :registrations
  has_many :goodgymers, through: :registrations
  has_many :pairings

  enum session_type: { CommunityMission: 0, SocialVisit: 1, GroupRun: 2 }
end
