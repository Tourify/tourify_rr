class AddAttachmentImageToPhotos < ActiveRecord::Migration[5.1]
  add_reference :photos, :organization, foreign_key: true
  add_reference :photos, :tour, foreign_key: true
  add_reference :photos, :stop, foreign_key: true

  def self.up
    change_table :photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photos, :image
  end
end
