class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description, null: false
      t.integer :owner_id, null: false
      t.string :visibility, null: false
      t.string :status, null: false

      t.timestamps null: false
    end
    add_index :goals, :owner_id
  end
end
