class GeeksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_geek, only: [:show]

  def index

    if params[:search].present?
      sql_query = " \
        geeks.name @@ :query \
        OR geeks.description @@ :query \
        OR geeks.location @@ :query \
        OR geeks.category @@ :query \
      "
      @geeks = policy_scope(Geek).where(sql_query, query: "%#{params[:search]}%").where.not(longitude: nil, latitude: nil)
    else
      @geeks = policy_scope(Geek).where.not(longitude: nil, latitude: nil)
    end

    @markers = @geeks.map do |geek|
      {
        lat: geek.latitude,
        lng: geek.longitude
      }
    end
  end

  def new
    @geek = Geek.new
    authorize @geek
  end

  def create
    @geek = Geek.new(geek_params)
    @geek.user = current_user
    authorize @geek
    if @geek.save
      redirect_to geek_path(@geek)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @geek.update(geek_params)
      redirect_to geek_path(@geek, notice: 'Geek was successfully updated.')
    else
      render :edit
    end
  end

  def show
    @booking = Booking.new
    #authorize @booking
    authorize @geek
  end

  private

  def geek_params
    params.require(:geek).permit(:category, :name, :photo, :description, :location, :price, :active, :trusted)
  end

  def find_geek
    @geek = Geek.find(params[:id])
  end
end
