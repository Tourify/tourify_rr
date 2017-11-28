class Organization < ApplicationRecord
  has_many :admins, dependent: :destroy
  has_many :tours, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :display_name

  require 'csv'

  def self.to_csv(options = {})
    org_columns =  column_names
    tour_info = ["tour_count", "tour_names"]
    desired_columns = org_columns - ["created_at", "updated_at"] + tour_info
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |org|
        csv << [org.id, org.name, org.description, org.url, org.logo_url, org.display_name, org.org_photo, org.content_credit, org.tours.count, org.tours.pluck(:name).join(', ')]
      end
    end
  end
end
