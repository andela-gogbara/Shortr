class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :browser
      t.string :ip
      t.string :os
      t.integer :latitude
      t.integer :longitude
      t.string :city
      t.references :link, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
