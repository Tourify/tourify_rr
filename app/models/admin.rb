class Admin < ApplicationRecord
  has_many :tours
  has_secure_password
end
