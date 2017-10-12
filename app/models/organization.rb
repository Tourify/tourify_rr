class Organization < ApplicationRecord
  has_many :admins
  has_many :tours

  validates_presence_of :name
  validates_presence_of :display_name
end
