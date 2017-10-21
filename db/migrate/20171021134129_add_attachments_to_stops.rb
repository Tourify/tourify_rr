class AddAttachmentsToStops < ActiveRecord::Migration[5.1]
  def change
    add_column :stops, :attachments, :string, array: true, default: []
  end
end
