class InputsController < ApplicationController
  def show
    spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id)
    incomes = Income.joins(:income_category).all.where(user_id: current_user.id)

    @samples = spendings | incomes
    @samples.sort!{ |spendings, incomes| incomes.created_at <=> spendings.created_at }

    @dw = ["日", "月", "火", "水", "木", "金", "土"]
  end
end
