class CreateProductBases < ActiveRecord::Migration
  def change
    create_table :product_bases do |t|
      t.string :name

      t.timestamps
    end
  end
end
