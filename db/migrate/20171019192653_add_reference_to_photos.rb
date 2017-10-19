class AddReferenceToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference(:photos, :imageable, polymorphic: true, index: true)
  end
end
