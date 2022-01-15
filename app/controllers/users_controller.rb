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

    spendings = Spending.joins(:spending_category).all.where(user_id: current_user.id)
    incomes = Income.joins(:income_category).all.where(user_id: current_user.id)

    @samples = spendings | incomes
    @samples.sort!{ |spendings, incomes| incomes.created_at <=> spendings.created_at }

    @dw = ["日", "月", "火", "水", "木", "金", "土"]

  end

  def delete
    redirect_to new_user_session_path
  end
end
