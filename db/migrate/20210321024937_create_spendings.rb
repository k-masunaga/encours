class CreateSpendings < ActiveRecord::Migration[5.2]
  def change
    create_table :spendings do |t|
      t.string :item_name,  null: false
      t.integer :price,     null: false
      t.date :date,         null: false
      t.string :memo
      t.timestamps
    end
  end
end
