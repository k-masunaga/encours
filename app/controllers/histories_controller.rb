class HistoriesController < ApplicationController
  before_action :set_q, only: [:index, :search, :show]

  def show
    @spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id).order("date ASC")
    @incomes = Income.joins(:income_category).all.where(user_id: current_user.id).order("date ASC")

    spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id).order("date ASC")
    incomes = Income.joins(:income_category).all.where(user_id: current_user.id).order("date ASC")

    @sample = spendings | incomes
    @sample.sort!{ |spendings, incomes| incomes.created_at <=> spendings.created_at }

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
