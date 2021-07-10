class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :price,     null: false
      t.date :date,         null: false
      t.string :memo
      t.timestamps
    end
  end
end
