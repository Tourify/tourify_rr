class AddImagesToStops < ActiveRecord::Migration[5.1]
  def change
    add_column :stops, :images, :json
    drop_table :photos
  end
end
