class RemoveHeadShaftAndAbbrevioationFromClubs < ActiveRecord::Migration
  def change
    remove_column :clubs, :head, :string
    remove_column :clubs, :shaft, :string
    remove_column :clubs, :abbreviation, :string
  end
end
