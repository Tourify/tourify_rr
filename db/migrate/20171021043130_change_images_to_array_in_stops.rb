class ChangeImagesToArrayInStops < ActiveRecord::Migration[5.1]
  def change
    change_column :stops, :images, :string
  end
end
