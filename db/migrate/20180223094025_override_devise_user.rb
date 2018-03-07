class OverrideDeviseUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string
    add_column :users, :locale, :string
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
  end
end