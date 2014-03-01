class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.string :body
      t.integer :goal_id
      t.integer :author_id


      t.timestamps
    end

    add_index :goal_comments, :goal_id
    add_index :goal_comments, :author_id
  end
end
