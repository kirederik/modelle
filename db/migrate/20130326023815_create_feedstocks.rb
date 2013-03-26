class CreateFeedstocks < ActiveRecord::Migration
  def change
    create_table :feedstocks do |t|
      t.string :name
      t.string :unity

      t.timestamps
    end
  end
end
