class ChangeValueTypeInTransaction < ActiveRecord::Migration
  def up
    change_table :transactions do |t|
      t.change :value, :float
    end
  end

  def down
  end
end

