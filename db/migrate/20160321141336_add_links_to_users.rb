class AddLinksToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :link, index: true, foreign_key: true
  end
end
