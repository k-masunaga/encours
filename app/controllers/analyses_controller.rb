class AnalysesController < ApplicationController
  def show
    spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id)
    incomes = Income.joins(:income_category).all.where(user_id: current_user.id)

    @total = spendings | incomes
    @total.sort!{ |spendings, incomes| incomes.date <=> spendings.date }

    @dw = ["日", "月", "火", "水", "木", "金", "土"]
  end
end
