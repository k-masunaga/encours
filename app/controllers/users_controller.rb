class UsersController < ApplicationController
  def new
    redirect_to user_path(current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def delete
    redirect_to new_user_session_path
  end
end
