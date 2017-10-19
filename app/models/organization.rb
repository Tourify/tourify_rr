class Organization < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :photos, as: imageable, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :display_name
end
