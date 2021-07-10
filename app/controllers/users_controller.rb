class UsersController < ApplicationController
  def new
    redirect_to user_path(current_user.id)
  end

  def show
  end

  def delete
  end
end
