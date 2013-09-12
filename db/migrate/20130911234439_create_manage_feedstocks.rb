class CreateManageFeedstocks < ActiveRecord::Migration
  def change
    create_table :manage_feedstocks do |t|
      t.belongs_to :feedstock
      t.integer :quantity
      t.string :action_type

      t.timestamps
    end
    add_index :manage_feedstocks, :feedstock_id
  end
end
