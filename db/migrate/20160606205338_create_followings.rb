class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :user_id
      t.integer :follower_id

      t.timestamps null: false
    end
    add_index :followings, :follower_id
    add_index :followings, :user_id
    add_index :followings, [:follower_id, :user_id], unique: true
  end
end
