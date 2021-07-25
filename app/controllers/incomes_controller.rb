class IncomesController < ApplicationController
  def new
    @income = Income.new
  end

  def create
    Income.create(post_params)
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.permit(:price, :date, :memo).merge(user_id: current_user.id)
  end
end
