class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def create
    Spending.create(post_params)
    redirect_to input_path(current_user.id)
  end

  private
  def post_params
    params.permit(:item_name, :spending_category_id, :price, :date, :memo).merge(user_id: current_user.id)
  end
end
