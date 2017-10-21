class RemoveImagesToArrayInStops < ActiveRecord::Migration[5.1]
  def change
    remove_column :stops, :images, :string
    add_column :stops, :image, :string
  end
end
