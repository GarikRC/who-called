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

  def edit
    @phone_number = PhoneNumber.find(params[:phone_number_id])
    @testimony = Testimony.find(params[:id])
  end

  def update
    @phone_number = PhoneNumber.find(params[:phone_number_id])
    @testimony = Testimony.find(params[:id])
    @testimony.update(testimony_params)
    if @testimony.valid?
      flash[:notice] = "The testimony has been updated."
      redirect_to phone_number_path(@phone_number)
    else
      render 'edit'
    end
  end

  def destroy
    @phone_number = PhoneNumber.find(params[:phone_number_id])
    @testimony = Testimony.find(params[:id])
    @testimony.destroy
    flash[:notice] = "The testimony has been deleted."
    redirect_to phone_number_path(@phone_number)
  end


private

  def testimony_params
    params.require(:testimony).permit(:user_id, :phone_number_id, :description, :tally)
  end
end