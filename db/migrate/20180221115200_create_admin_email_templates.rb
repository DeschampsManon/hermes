class CreateAdminEmailTemplates < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_email_templates do |t|
      t.string :title
      t.string :source
      t.string :slug
      t.timestamps
    end
    add_index :admin_email_templates, :slug, unique: true
  end
end
