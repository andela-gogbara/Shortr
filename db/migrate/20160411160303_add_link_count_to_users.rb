class AddLinkCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :link_count, :integer
  end
end
