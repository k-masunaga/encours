class Spending < ApplicationRecord
  belongs_to :spending_category
  belongs_to :user

  validates :item_name, presence: true
  validates :price, presence: true, numericality: {only_integer: true}
  validates :date, presence: true
end
