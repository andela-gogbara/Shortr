class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :full_url
      t.string :short_url
      t.boolean :active
      t.integer :count
      
      t.timestamps null: false
    end
  end
end
