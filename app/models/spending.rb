class Spending < ApplicationRecord
  belongs_to :spending_category
  belongs_to :user
end
