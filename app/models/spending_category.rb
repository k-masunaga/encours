class SpendingCategory < ApplicationRecord
  has_ancestry
  has_many :spendings
end
