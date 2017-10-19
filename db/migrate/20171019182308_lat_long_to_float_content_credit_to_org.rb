class LatLongToFloatContentCreditToOrg < ActiveRecord::Migration[5.1]
  def change
    add_column :organizations, :content_credit, :string
    change_column :stops, :gps_lat, :float
    change_column :stops, :gps_long, :float
  end
end
