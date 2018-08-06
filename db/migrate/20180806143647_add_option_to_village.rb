class AddOptionToVillage < ActiveRecord::Migration[5.2]
  def change
    add_column :villages, :villager, :integer, default: 1, null: false
    add_column :villages, :wolf, :integer, default: 1, null: false
    add_column :villages, :seer, :integer, default: 0, null: false
    add_column :villages, :hunter, :integer, default: 0, null: false
    add_column :villages, :madman, :integer, default: 0, null: false
  end
end
