class Income < ApplicationRecord
  belongs_to :income_category
  belongs_to :user

  validates :price, presence: true, numericality: {only_integer: true}
  validates :date, presence: true
end
