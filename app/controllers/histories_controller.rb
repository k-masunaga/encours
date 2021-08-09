class HistoriesController < ApplicationController
  def show
    @spendings = Spending.all.where(user_id: current_user.id)
    @incomes = Income.all.where(user_id: current_user.id)
    # @all = User.Joins(:spending, :income).all.where(user_id: current_user.id)
  end
end
