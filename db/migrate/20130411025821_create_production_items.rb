class CreateProductionItems < ActiveRecord::Migration
  def change
    create_table :production_items do |t|
      t.belongs_to :production_status
      t.belongs_to :order

      t.timestamps
    end
    add_index :production_items, :production_status_id
    add_index :production_items, :order_id
  end
end
