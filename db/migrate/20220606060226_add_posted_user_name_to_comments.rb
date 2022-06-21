class AddPostedUserNameToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :posted_user_name, :string
  end
end
