class AnalysesController < ApplicationController
  before_action :set_q, only: [:index, :search, :show]
  def index
  end

  def show
  end

  def search
    @results = @q.result.where(user_id: current_user.id)
  end

  private
  def set_q
    @q = Spending.ransack(params[:q])
    @spending_category = SpendingCategory.all
    @dw = ["日", "月", "火", "水", "木", "金", "土"]
  end

end
