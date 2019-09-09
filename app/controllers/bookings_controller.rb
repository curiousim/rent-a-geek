class BookingsController < ApplicationController
  before_action :set_geek, only: [ :create ]

  def create
    @booking = booking.new(booking_params)
    @booking.geek = @geek
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to geek_path(@geek)
    else
      render "geeks/show"
    end
  end

  def destroy
    @booking = booking.find(params[:id])
    authorize @booking
    id = @booking.geek_id
    @booking.destroy
    redirect_to geek_path(id)
  end

  private

  def set_geek
    @geek = geek.find(params[:geek_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :date, :time, :address, :duration)
  end
end
