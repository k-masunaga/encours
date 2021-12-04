class AnalysesController < ApplicationController
  before_action :set_q, only: [:index, :search, :show]
  def index
  end

  def show
    spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id)
    incomes = Income.joins(:income_category).all.where(user_id: current_user.id)

    @spending_category = SpendingCategory.all

    @total = spendings | incomes
    @total.sort!{ |spendings, incomes| incomes.date <=> spendings.date }

    @dw = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def search
    @results = @q.result
  end

  private
  def set_q
    @q = Spending.ransack(params[:q])
  end

end
