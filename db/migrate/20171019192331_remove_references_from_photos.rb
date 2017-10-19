class RemoveReferencesFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:photos, :stop, index: true, foreign_key: true)
    remove_reference(:photos, :tour, index: true, foreign_key: true)
    remove_reference(:photos, :organization, index: true, foreign_key: true)
  end
end
