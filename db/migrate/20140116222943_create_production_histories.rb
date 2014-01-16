class CreateProductionHistories < ActiveRecord::Migration
  def change
    create_table :production_histories do |t|
      t.belongs_to :production_item
      t.integer :status_from_id
      t.integer :status_to_id

      t.timestamps
    end
    add_index :production_histories, :production_item_id
  end
end
