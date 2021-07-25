class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def create
    Spending.create(post_params)
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.permit(:item_name, :price, :date, :memo).merge(user_id: current_user.id)
  end
end