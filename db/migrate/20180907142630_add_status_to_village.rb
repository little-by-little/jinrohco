class AddStatusToVillage < ActiveRecord::Migration[5.2]
  def change
    add_column :villages, :status, :integer
  end
end
