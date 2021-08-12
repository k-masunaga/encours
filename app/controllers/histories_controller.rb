class HistoriesController < ApplicationController
  def show
    @spendings = Spending.all.where(user_id: current_user.id).order("date ASC")
    @incomes = Income.all.where(user_id: current_user.id).order("date ASC")
    @spending_catgory = SpendingCategory.select(:name)
    @income_category = IncomeCategory.all
  end
end
