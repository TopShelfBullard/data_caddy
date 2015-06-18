class AddBananaHookAndSliceToShots < ActiveRecord::Migration
  def change
    add_column :shots, :banana_hook, :boolean, :default => false
    add_column :shots, :banana_slice, :boolean, :default => false
  end
end
