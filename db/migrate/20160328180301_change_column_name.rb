class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :links, :count, :visit_count
  end
end
