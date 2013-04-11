class CreateProductionStatuses < ActiveRecord::Migration
  def change
    create_table :production_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
