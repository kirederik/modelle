class CreateFilials < ActiveRecord::Migration
  def change
    create_table :filials do |t|
      t.string :name

      t.timestamps
    end
  end
end
