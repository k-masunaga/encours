class HistoriesController < ApplicationController
  def show
    @spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id).order("date ASC")
    @incomes = Income.joins(:income_category).all.where(user_id: current_user.id).order("date ASC")
    @spending_category = SpendingCategory.all.where(id: params[:id])
    @income_category = IncomeCategory.all.where(id: params[:id])
  end
end
