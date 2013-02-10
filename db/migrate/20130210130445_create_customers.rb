class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cpf_cnpj
      t.string :municipal_number
      t.string :suframa
      t.string :tribute
      t.string :addres
      t.string :city
      t.string :state
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :mobile
      t.string :email
      t.integer :user_id
      t.text :observations

      t.timestamps
    end
  end
end
