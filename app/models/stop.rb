class Stop < ApplicationRecord
  belongs_to :tour
  belongs_to :admin

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      stop_hash = row.to_hash
      stop = Stop.where(id: stop_hash["id"])

      if stop.count == 1
        stop.first.update_attributes(stop_hash)
      else
        Stop.create!(stop_hash)
      end # end if !stop.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
