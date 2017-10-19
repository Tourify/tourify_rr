class Stop < ApplicationRecord
  belongs_to :tour
  belongs_to :admin

  has_many :photos, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :photos

  validates_presence_of :stop_num
  validates_uniqueness_of :stop_num, scope: [:tour_id]

  validates_presence_of :name
  validates_presence_of :location

  require 'csv'

  def self.import(file, tour_id, current_admin)
    tour = Tour.find_by(id: tour_id)
    if tour
      CSV.foreach(file.path, headers: true) do |row|
        tour.stops.create! row.to_hash
      end
    end
  end

  def self.to_csv(options = {})
    all_columns = column_names
    desired_columns = all_columns - ["id", "created_at", "updated_at"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |stop|
        csv << stop.attributes.values_at(*desired_columns)
      end
    end
  end
end
