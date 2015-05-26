class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :head
      t.string :shaft
      t.string :abbreviation
      t.timestamps null: false
    end
  end
end
