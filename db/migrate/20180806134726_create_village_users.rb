class CreateVillageUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :village_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :village, index:true , foreign_key: true

      t.timestamps
    end
  end
end
