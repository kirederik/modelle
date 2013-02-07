class AddFunctionToUser < ActiveRecord::Migration
  def change
    add_column :users, :function_id, :integer
  end
end
