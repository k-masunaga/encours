class HistoriesController < ApplicationController

  def show
    @spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id).order("date ASC")
    @incomes = Income.joins(:income_category).all.where(user_id: current_user.id).order("date ASC")

    @dw = ["日", "月", "火", "水", "木", "金", "土"]
  end
end
