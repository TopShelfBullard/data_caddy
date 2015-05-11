class CreateShotActions < ActiveRecord::Migration
  def change
    create_table :shot_actions do |t|
      t.boolean :take_mulligan
      t.boolean :take_drop
      t.boolean :take_gimme

      t.timestamps null: false
    end
  end
end
