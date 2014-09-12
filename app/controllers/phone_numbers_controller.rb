class PhoneNumbersController < ApplicationController
  def index
    @phone_numbers = PhoneNumber.all
  end

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = PhoneNumber.new(phone_numbers_params)
    if @phone_number.save
      session[:phone_number_id] = @phone_number.id
      redirect_to root_url, notice: "The number has been logged."
    else
      render 'new'
    end
  end

private

  def users_params
    params.require(:user).permit(:user_id, :number)
  end
end
