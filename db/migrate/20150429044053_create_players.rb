class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false, default: ""

      t.timestamps null: false
    end
  end
end
