class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :name
      t.integer :area_id
      t.integer :registration_limit
      t.integer :session_type

      t.timestamps
    end
  end
end
