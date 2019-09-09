class GeeksController < ApplicationController

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

  private

  def geek_params
    params.require(:geek).permit(:category, :name, :description, :location, :price, :active, :trusted)
  end
end
