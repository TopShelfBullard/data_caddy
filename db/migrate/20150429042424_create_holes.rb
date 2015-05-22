class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :number
      t.integer :par
      t.integer :distance
      t.references :course, index: true

      t.timestamps null: false
    end
  end
end
