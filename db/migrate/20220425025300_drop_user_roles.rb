class DropUserRoles < ActiveRecord::Migration[6.1]
  def up
    drop_table :user_roles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
