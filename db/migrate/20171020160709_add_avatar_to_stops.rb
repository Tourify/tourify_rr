class AddAvatarToStops < ActiveRecord::Migration[5.1]
  def change
    add_column :stops, :avatar, :string
  end
end
