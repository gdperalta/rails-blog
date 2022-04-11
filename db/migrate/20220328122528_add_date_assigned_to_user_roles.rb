class AddDateAssignedToUserRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :user_roles, :date_assigned, :date
  end
end
