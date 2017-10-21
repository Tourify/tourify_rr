class ChangeImagesToArrayInStops < ActiveRecord::Migration[5.1]
  def change
    add_column :stops, :image, :string
  end
end
