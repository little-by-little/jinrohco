class CreateVillages < ActiveRecord::Migration[5.2]
  def change
    create_table :villages do |t|
      t.string :name
      t.integer :type, default: 1

      t.timestamps
    end
  end
end
