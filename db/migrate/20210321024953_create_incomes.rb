class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :price,     null: false
      t.date :date,         null: false
      t.string :memo
      t.integer :user_id, null: false, foreign_key: true
      t.integer :income_categories_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
