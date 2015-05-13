class CreateCoursePlayers < ActiveRecord::Migration
  def change
    create_table :course_players do |t|
      t.integer :player_id
      t.integer :course_id
      t.integer :highest_score
      t.integer :lowest_score
      t.integer :average_score
      t.integer :best_hole_id
      t.integer :worst_hole_id
      t.integer :dream_round
      t.integer :nightmare_round

      t.timestamps null: false
    end
  end
end
