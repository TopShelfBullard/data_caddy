class AddOffTheTurfToLies < ActiveRecord::Migration
  def change
    add_column :lies, :off_the_turf, :boolean
  end
end
