class AddPatientToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :patient, :string
  end
end
