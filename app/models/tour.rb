class Tour < ApplicationRecord
  has_many :stops
  belongs_to :admin
  belongs_to :organization

  validates_presence_of :name
  validates_presence_of :description
end
