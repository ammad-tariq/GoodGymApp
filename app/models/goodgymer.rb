class Goodgymer < ApplicationRecord
  has_many :registrations
  has_many :sessions, through: :registrations
  has_many :pairings

  enum role: { Regular: 0, TaskForce: 1 }
end
