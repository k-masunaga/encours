class UsersController < ApplicationController
  def new
    redirect_to user_path(current_user.id)
  end

  def show
    @user = User.find(params[:id])

    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @this_year = @month.year
    @this_month = @month.month
    @sdg_orders = Spending.where(date: @month.all_month)
    @icm_orders = Income.where(date: @month.all_month)

    @ratio = @sdg_orders.joins(:spending_category).group("name").sum(:price).sort_by { |_, v| v }.reverse.to_h

  end

  def delete
    redirect_to new_user_session_path
  end
end
