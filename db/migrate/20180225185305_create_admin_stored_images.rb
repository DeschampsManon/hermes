class CreateAdminStoredImages < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_stored_images do |t|
      t.string   :title
      t.string   :alt
      t.integer   :stored_image_id
      t.timestamps
    end
  end
end
