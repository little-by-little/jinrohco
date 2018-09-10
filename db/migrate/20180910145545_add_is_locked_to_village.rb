class AddIsLockedToVillage < ActiveRecord::Migration[5.2]
  def change
    add_column :villages, :is_locked, :boolean, default: false, null: false 
  end
end
