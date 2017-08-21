class AddEightironToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :eightiron, :string
  end
end
