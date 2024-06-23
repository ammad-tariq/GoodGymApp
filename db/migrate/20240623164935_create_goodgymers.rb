class CreateGoodgymers < ActiveRecord::Migration[6.1]
  def change
    create_table :goodgymers do |t|
      t.string :name
      t.integer :area_id
      t.string :role
      t.boolean :dbs_verified

      t.timestamps
    end
  end
end
