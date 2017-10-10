class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :main_tour_photo
      t.float :distance, default: 0
      t.integer :time_in_mins, default: 0
      t.belongs_to :admin, foreign_key: true
      t.belongs_to :organization, foreign_key: true

      t.timestamps
    end
  end
end
