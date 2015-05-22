class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.date :date
      t.integer :score
      t.boolean :finished
      t.references :course, index: true
      t.references :player, index: true

      t.timestamps null: false
    end
  end
end
