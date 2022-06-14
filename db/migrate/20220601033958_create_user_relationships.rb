class CreateUserRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :user_relationships do |t|
      t.integer :following_id, null: false
      t.integer :follower_id, null: false

      t.timestamps
    end
    add_index :user_relationships, [:following_id, :follower_id], unique: true
  end
end
