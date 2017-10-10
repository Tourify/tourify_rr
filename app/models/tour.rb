class Tour < ApplicationRecord
  has_many :stops
  belongs_to :admin
  belongs_to :organization
end
