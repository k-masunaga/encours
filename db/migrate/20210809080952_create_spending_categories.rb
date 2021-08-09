class CreateSpendingCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :spending_categories do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
  end
end
