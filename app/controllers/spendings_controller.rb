class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def create
    Spending.create(post_params)
    redirect_to input_path(current_user.id)
  end

  def edit
    @spending = Spending.find(params[:id])
  end

  def update
    @spending = Spending.find(params[:id])
    @spending.update(update_params)
    redirect_to history_path(current_user.id)
  end

  def delete
  end

  private
  def post_params
    params.permit(:item_name, :spending_category_id, :price, :date, :memo).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:spending).permit(:item_name, :spending_category_id, :price, :date, :memo).merge(user_id: current_user.id)
  end
end
