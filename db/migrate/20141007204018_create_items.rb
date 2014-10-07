class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :classification
      t.integer :quantity

      t.timestamps
    end
  end
end
