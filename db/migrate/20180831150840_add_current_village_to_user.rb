class AddCurrentVillageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_village, :integer
  end
end
