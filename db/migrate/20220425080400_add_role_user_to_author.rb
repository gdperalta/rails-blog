class AddRoleUserToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_reference :authors, :role_user, null: false, foreign_key: true
  end
end
