class AddCodeToProductBase < ActiveRecord::Migration
  def change
    add_column :product_bases, :code, :string
  end
end
