class GeeksController < ApplicationController
  before_action :find_geek, only: [:show]

  def index
    @geeks = Geek.all
  end

  def new
    @geek = Geek.new
  end

  def create
    @geek = Geek.new(geek_params)
    if @geeek.save
      redirect_to geek_path(@geek)
    else
      render :new
    end
  end

  def show
  end

  private

  def geek_params
    params.require(:geek).permit(:category, :name, :photo, :description, :location, :price, :active, :trusted)
  end

  def find_geek
    @geek = Geek.find(params[:id])
  end
end
