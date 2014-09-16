class PhoneNumbersController < ApplicationController
  def index
    @phone_numbers = PhoneNumber.all
  end

  def new
    @phone_number = PhoneNumber.new
  end

  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    if @phone_number.save
      session[:phone_number_id] = @phone_number.id
      redirect_to root_url, notice: "The number has been logged."
    else
      render 'new'
    end
  end

  def show
    @phone_number = PhoneNumber.find(params[:id])
  end

  def edit
    @phone_number = PhoneNumber.find(current_user.id)
  end

  def update
    @phone_number = phone_number.find(current_user.id)
    @phone_number.update(phone_number_params)
    if @phone_number.valid?
      flash[:notice] = "#{@phone_number.number} has been updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end


private

  def phone_number_params
    params.require(:phone_number).permit(:user_id, :number)
  end
end
