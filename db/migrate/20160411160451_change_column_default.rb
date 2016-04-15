class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :link_count, 0
  end
end
