class AddUserPermissions < ActiveRecord::Migration
  def change
    add_column :users, :permissions, :text, default: [].to_yaml
  end
end
