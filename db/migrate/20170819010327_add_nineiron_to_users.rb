class AddNineironToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nineiron, :string
  end
end
