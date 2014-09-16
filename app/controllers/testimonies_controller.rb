class TestimoniesController < ApplicationController

  def new
    @testimony = Testimony.new
    @phone_number = PhoneNumber.find(params[:phone_number_id])
  end

  def create
    @testimony = Testimony.new(testimony_params)
    if @testimony.save
      redirect_to root_url, notice: "Testimony added!"
    else
      render "new"
    end
  end


private

  def testimony_params
    params.require(:testimony).permit(:user_id, :phone_number_id, :description, :tally)
  end
end