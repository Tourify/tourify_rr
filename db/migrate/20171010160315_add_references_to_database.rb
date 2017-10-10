class AddReferencesToDatabase < ActiveRecord::Migration[5.1]
  def change
    add_reference :admins, :organization, foreign_key: true
    add_reference :tours, :organization, foreign_key: true
    add_reference :tours, :admin, foreign_key: true
    add_reference :stops, :tour, foreign_key: true
    add_reference :stops, :admin, foreign_key: true
  end
end
