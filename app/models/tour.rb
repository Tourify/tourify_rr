class Tour < ApplicationRecord
  belongs_to :admin
  belongs_to :organization

  has_many :stops, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description
end
