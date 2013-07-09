class ChangeProduct < ActiveRecord::Migration
  def up
  	add_column :products, :product_color_id, :integer
  	add_column :products, :product_size_id, :integer

  	remove_column :products, :color
  	remove_column :products, :size
  end

  def down
  	remove_column :products, :product_color_id
  	remove_column :products, :product_size_id

  	add_column :products, :color, :string
  	add_column :products, :size, :string
  end
end
