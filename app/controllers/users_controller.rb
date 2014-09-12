class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]
  def index
    @users = User.all
    @phone_numbers = PhoneNumber.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(users_params)
    if @user.valid?
      flash[:notice] = "#{@user.email} has been updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    flash[:notice] = "#{@user.email} has been deleted"
    redirect_to root_url
  end

private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
