class ChangeDeleteToDeleted < ActiveRecord::Migration
  def up
    rename_column :links, :delete, :deleted
end

  def down
    rename_column :links, :deleted, :delete
  end
end
