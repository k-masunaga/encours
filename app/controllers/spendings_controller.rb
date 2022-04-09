class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def create
    @input = Spending.create(post_params)
    if @input.save
      redirect_to input_path(current_user.id), notice: '入力が完了しました'
    else
      redirect_to input_path(current_user.id)
      flash[:alert] = '入力未完了です。入力抜け、もしくはデータ形式が正しくない箇所があります。'
    end
  end

  def edit
    @spending = Spending.find(params[:id])
  end

  def update
    spending = Spending.find(params[:id])
    spending.update(update_params)
    redirect_to history_path(current_user.id)
  end

  def destroy
    spending = Spending.find(params[:id])
    if spending.user_id == current_user.id
      spending.destroy
    end
    redirect_to history_path(current_user.id)
  end

  private
  def post_params
    params.permit(:item_name, :spending_category_id, :price, :date, :memo).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:spending).permit(:item_name, :spending_category_id, :price, :date, :memo).merge(user_id: current_user.id)
  end
end
