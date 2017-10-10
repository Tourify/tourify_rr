class Admin < ApplicationRecord
  has_many :tours
  has_many :stops
  belongs_to :organization
  
  has_secure_password
end
