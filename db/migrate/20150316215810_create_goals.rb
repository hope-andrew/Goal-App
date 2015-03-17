class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content, null: false
      t.boolean :completed, null: false
      t.boolean :private, null: false
      t.integer :user_id, null:false, add_index: true

      t.timestamps null: false
    end
  end
end
