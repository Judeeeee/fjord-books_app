class ChangeUserrelationshipsToUserRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_table :userrelationships, :user_relationships
  end
end
