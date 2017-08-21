class AddThreewoodToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :Threewood, :string
  end
end
