class GeeksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_geek, only: [:show, :edit, :update, :destroy]
  before_action :find_geek_reviews, only: [:show]

  def index
    sql_query = " \
      geeks.name @@ :query \
      OR geeks.description @@ :query \
      OR geeks.location @@ :query \
      OR geeks.category @@ :query \
      "
    if params[:search_nav].present? 
      @geeks = policy_scope(Geek).where(sql_query, query: "%#{params[:search_nav]}%").where.not(longitude: nil, latitude: nil)

    elsif params[:search].present?
      if params[:search][:category] != 'All' && params[:search][:name] != ''
        # Have category and name
        @geeks = policy_scope(Geek).where(category: params[:search][:category]).where(sql_query, query: "%#{params[:search][:name]}%").where.not(longitude: nil, latitude: nil)
      elsif params[:search][:name] != '' && params[:search][:category] == 'All'
        # Don't have category but name not empty
        @geeks = policy_scope(Geek).where(sql_query, query: "%#{params[:search][:name]}%").where.not(longitude: nil, latitude: nil)
      elsif params[:search][:name] == '' && params[:search][:category] != 'All'
        # Name is empty, but category isn't
        @geeks = policy_scope(Geek).where(category: params[:search][:category]).where.not(longitude: nil, latitude: nil)
      elsif
        # Everything is empty
        @geeks = policy_scope(Geek).where.not(longitude: nil, latitude: nil)
      end   
      

    else
      @geeks = policy_scope(Geek).where.not(longitude: nil, latitude: nil)
    end

    @markers = @geeks.map do |geek|
      {
        lat: geek.latitude,
        lng: geek.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { geek: geek }),
        image_url: helpers.asset_url('logo.png')
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
    authorize @geek
  end

  def update
    if @geek.update(geek_params)
      authorize @geek
      redirect_to geek_path(@geek, notice: 'Geek was successfully updated.')
    else
      render :edit
    end
  end

  def show
    @booking = Booking.new
    @markers = [{
        lat: @geek.latitude,
        lng: @geek.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { geek: @geek }),
        image_url: helpers.asset_url('logo.png')
      }]
    authorize @geek
  end

  def destroy
    authorize @geek
    redirect_to geeks_path if @geek.destroy!
  end

  private

  def geek_params
    params.require(:geek).permit(:category, :name, :photo, :description, :location, :price, :active, :trusted)
  end

  def find_geek
    @geek = Geek.find(params[:id])
  end

  def find_geek_reviews
    @reviews = Booking.where(geek_id: params[:id]).select {|booking| booking.rating }
  end
end
