class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :level
      t.integer :user_id
      t.integer :action_id

      t.timestamps
    end
  end
end
