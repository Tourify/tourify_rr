class Organization < ApplicationRecord
  has_many :admins
  has_many :tours

end
