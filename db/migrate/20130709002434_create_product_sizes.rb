class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.string :name

      t.timestamps
    end
  end
end
