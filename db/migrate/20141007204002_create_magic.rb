class CreateMagic < ActiveRecord::Migration
  def change
    create_table :magics do |t|
      t.string :name
      t.string :description
      t.integer :classification
      t.integer :damage

      t.timestamps
    end
  end
end
