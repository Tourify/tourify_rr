class Stop < ApplicationRecord
  belongs_to :tour
  belongs_to :admin

  validates_presence_of :stop_num
  validates_uniqueness_of :stop_num, scope: [:tour_id]

  validates_presence_of :name
  validates_presence_of :location

  require 'csv'

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

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      stop_hash = row.to_hash
      stop = Stop.where(id: stop_hash["id"])

      if stop.count == 1
        stop.first.update_attributes(stop_hash)
      else
        Stop.create!(stop_hash)
      end
    end
  end
end
