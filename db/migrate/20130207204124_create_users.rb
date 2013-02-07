class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.date :dateofbirth
      t.string :sex
      t.date :hide_date
      t.date :fire_date
      t.string :address
      t.string :city
      t.string :state
      t.string :cep
      t.string :phone1
      t.string :phone2
      t.string :cel_number
      t.float :wage
      t.text :observations

      t.timestamps
    end
  end
end
