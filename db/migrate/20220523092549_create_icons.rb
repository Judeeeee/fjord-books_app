class CreateIcons < ActiveRecord::Migration[6.1]
  def change
    create_table :icons do |t|

      t.timestamps
    end
  end
end
