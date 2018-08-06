class AddCreatedByToVillage < ActiveRecord::Migration[5.2]
  def change
    add_column :villages, :created_by, :integer
  end
end
