class AddDriverToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :driver, :string
  end
end
