class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.integer :stop_num, null: false
      t.string :name, null: false
      t.string :directions_to_next_stop
      t.string :learn_more_URL
      t.text :travel_tip
      t.text :description
      t.string :location, null: false
      t.string :image_current
      t.string :image_historic
      t.integer :gps_long, default: 0
      t.integer :gps_lat, default: 0
      t.string :badge
      t.belongs_to :tour, foreign_key: true
      t.belongs_to :admin, foreign_key: true
      t.timestamps
    end
  end
end
