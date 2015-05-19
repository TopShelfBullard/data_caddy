class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :course_id
      t.integer :player_id
      t.date :date
      t.integer :score
      t.boolean :finished

      t.timestamps null: false
    end
  end
end
