class BookingsController < ApplicationController
  before_action :set_geek, only: [ :create, :edit, :show ]
  before_action :set_booking, only: [ :edit, :update, :add_review, :show, :destroy ]
  before_action :calc_avg_rating, only: [:create]
  before_action :find_geek_reviews, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.geek = @geek
    @booking.user = current_user
    authorize @booking
    if @booking.save!
      render "show"
    else
      render "geeks/show"
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
    authorize @booking
    id = @booking.geek_id
    @booking.destroy
    redirect_to dashboard_path
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

  def calc_avg_rating
    # @average = Booking.where(geek_id: params[:id]).average(:rating)
    @average = @geek.bookings.average(:rating)
    @average = 0 if @geek.bookings.empty? || @average.nil?
  end
  def find_geek_reviews
    # @reviews = Booking.where(geek_id: params[:id]).select {|booking| booking.rating }
    @reviews = @geek.bookings.select {|booking| booking.rating }
  end
end
