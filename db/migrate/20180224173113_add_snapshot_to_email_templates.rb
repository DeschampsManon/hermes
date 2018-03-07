class AddSnapshotToEmailTemplates < ActiveRecord::Migration[5.0]
  def up
    add_attachment :admin_email_templates, :snapshot
  end

  def down
    remove_attachment :admin_email_templates, :snapshot
  end
end
