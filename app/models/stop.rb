class Stop < ApplicationRecord
  # mount_uploader :image, ImageUploader
  # mount_uploader :attachments, AttachmentUploader
  # attr_accessor :image

  belongs_to :tour
  belongs_to :admin

  validates_presence_of :stop_num
  validates_uniqueness_of :stop_num, scope: [:tour_id]

  validates_presence_of :name
  validates_presence_of :location

  require 'csv'

  def self.import(file, tour_id)
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
