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

  def edit
    @phone_number = PhoneNumber.find(current_user.id)
  end

  def update
    @phone_number = phone_number.find(current_phone_number.id)
    @phone_number.update(phone_numbers_params)
    if @phone_number.valid?
      flash[:notice] = "#{@phone_number.email} has been updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end


private

  def phone_numbers_params
    params.require(:user).permit(:user_id, :number)
  end
end
