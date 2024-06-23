class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.integer :goodgymer_id
      t.integer :session_id

      t.timestamps
    end
  end
end
