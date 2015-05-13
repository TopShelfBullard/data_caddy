class RemoveOffTheTurfFromLies < ActiveRecord::Migration
  def change
    remove_column :lies, :Off_the_turf, :boolean
  end
end
