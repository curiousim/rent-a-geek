class BookingsController < ApplicationController
  before_action :set_geek, only: [ :create, :edit, :show ]
  before_action :set_booking, only: [ :edit, :update, :add_review, :show, :destroy ]

  def create
    @booking = Booking.new(booking_params)
    @booking.geek = @geek
    @booking.user = current_user
    authorize @booking
    if @booking.save!
      # redirect_to geek_path(@geek, notice: 'Booking was successfully created.')
      # redirect_to booking_path(@booking, notice: 'Please approve your booking.')
      render "show"
    else
      render "geeks/show"
      # render "dashboard"
    end
  end

  def show
    authorize @booking
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    authorize @booking
    @booking.save
    redirect_to dashboard_path
  end

  def add_review
    authorize @booking
  end

  def destroy
    # @booking = Booking.find(params[:id])
    authorize @booking
    id = @booking.geek_id
    @booking.destroy
    # render "show"
    redirect_to geek_path(id)
  end

  private

  def set_geek
    @geek = Geek.find(params[:geek_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :date, :time, :address, :duration, :review_content, :rating)
  end
end
