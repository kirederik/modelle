class CreateUsersFunctionsJoinTable < ActiveRecord::Migration
  def up
    create_table :functions_users, :id => false do |t|
      t.integer :user_id
      t.integer :function_id
    end
  end

  def down
    drop_table :functions_users
  end
end
