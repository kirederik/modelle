require 'rake/dsl_definition'
class AddPrintedToProductionItems < ActiveRecord::Migration
  def change
    add_column :production_items, :printed, :bool
  end
end
