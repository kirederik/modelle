class AddColumnsToProducts < ActiveRecord::Migration
  def change

    add_column :products, :color, :string
    add_column :products, :size, :string
    add_column :products, :line, :integer
    add_column :products, :description, :string

  end
end
