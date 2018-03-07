class AddImageToStoredImages < ActiveRecord::Migration[5.0]
  def up
    add_attachment :admin_stored_images, :url
  end

  def down
    remove_attachment :admin_stored_images, :url
  end
end
