class RemoveIsVerifiedFromAuthors < ActiveRecord::Migration[6.1]
  def change
    remove_column :authors, :is_verified, :boolean
    add_column :authors, :is_verified, :boolean, default: false
  end
end
