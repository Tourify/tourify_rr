class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.text :description
      t.string :url
      t.string :logo_url
      t.string :display_name, null: false
      t.string :org_photo

      t.timestamps
    end
  end
end
