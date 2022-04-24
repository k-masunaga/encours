class IncomesController < ApplicationController
  def new
    @income = Income.new
  end

  def create
    @input = Income.create(post_params)
    if @input.save
      redirect_to input_path(current_user.id), notice: '入力が完了しました'
    else
      redirect_to input_path(current_user.id)
      flash[:alert] = '入力未完了です。入力抜け、もしくはデータ形式が正しくない箇所があります。'
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    income = Income.find(params[:id])
    income.update(update_params)
    if income.update_attributes(update_params) == true
      redirect_to history_path(current_user.id), notice: '編集が完了しました'
    else
      redirect_to history_path(current_user.id)
      flash[:alert] = '編集に失敗しました。入力抜け、もしくはデータ形式が正しくない箇所があります。'
    end
  end

  def destroy
    income = Income.find(params[:id])
    if income.user_id == current_user.id
      income.destroy
      redirect_to history_path(current_user.id),notice: '削除が完了しました'
    else
      redirect_to history_path(current_user.id)
      flash[:alert] = '削除に失敗しました。'
    end
  end

  private
  def post_params
    params.permit(:price, :income_category_id, :date, :memo).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:income).permit(:price, :income_category_id, :date, :memo).merge(user_id: current_user.id)
  end
end
