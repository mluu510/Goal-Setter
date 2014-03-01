class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.string :body
      t.integer :victim_id
      t.integer :author_id

      t.timestamps
    end

    add_index :user_comments, :victim_id
    add_index :user_comments, :author_id

  end
end
