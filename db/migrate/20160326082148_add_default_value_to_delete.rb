class AddDefaultValueToDelete < ActiveRecord::Migration
  def up
    change_column :links, :delete, :boolean, default: false
  end

  def down
    change_column :links, :delete, :boolean, default: false
  end
end
