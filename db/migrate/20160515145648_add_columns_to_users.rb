class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :writer, :boolean
    add_column :users, :admin, :boolean
  end
end
