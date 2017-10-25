class Organization < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :tours, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :display_name
end
