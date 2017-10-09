class CreateStops < ActiveRecord::Migration[5.1]
  def change
    create_table :stops do |t|
      t.integer :Stop_num
      t.string :Name
      t.string :Directions_to_next_stop
      t.string :Learn_more_URL
      t.text :Travel_tip
      t.text :Description
      t.string :Location
      t.string :Image_current
      t.string :Image_historic
      t.integer :GPS_long
      t.integer :GPS_lat
      t.string :Badge
      # t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
