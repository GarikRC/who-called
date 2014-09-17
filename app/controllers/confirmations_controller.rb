class ConfirmationsController < ApplicationController

  def new
    @confirmation = Confirmation.new
  end

  def create
  	@phone_number = PhoneNumber.find(params[:phone_number_id])
    @testimony = Testimony.find(params[:testimony_id])
    params[:confirmation] = {testimony_id: params[:testimony_id]}
    @confirmation = Confirmation.create(confirmation_params)
    if @confirmation.valid?
      flash[:notice] = "Your confirmation has been counted!"
      Testimony.increment_counter(:tally, @confirmation.testimony_id)
      redirect_to phone_number_path(@phone_number)
    else
      redirect_to phone_number_path(@phone_number)
    end
  end

private

  def confirmation_params
    params.require(:confirmation).permit(:testimony_id, :user_id).merge(:user_id => current_user.id)
  end
end