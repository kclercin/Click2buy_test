class UsersController < ApplicationController
  before_action :require_user, only: [:cart]
  before_action :require_no_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new resource_params
    if @user.save
      flash[:success] = t(:account_successfull_created)
      redirect_to products_path
    else
      render :new
    end
  end

  def cart

  end

private

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
