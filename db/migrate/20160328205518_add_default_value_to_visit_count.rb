class AddDefaultValueToVisitCount < ActiveRecord::Migration
  def up
  change_column :links, :visit_count, :integer, :default => 0
end

def down
  change_column :links, :visit_count, :integer, :default => nil
end
end
