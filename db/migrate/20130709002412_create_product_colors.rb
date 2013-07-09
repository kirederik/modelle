class CreateProductColors < ActiveRecord::Migration
  def change
    create_table :product_colors do |t|
      t.string :name

      t.timestamps
    end
  end
end
