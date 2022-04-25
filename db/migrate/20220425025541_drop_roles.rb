class DropRoles < ActiveRecord::Migration[6.1]
  def change
    drop_table :roles do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
