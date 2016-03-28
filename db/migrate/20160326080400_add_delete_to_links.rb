class AddDeleteToLinks < ActiveRecord::Migration
  def change
    add_column :links, :delete, :boolean, :default => true
  end
end
