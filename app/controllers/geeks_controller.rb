class GeeksController < ApplicationController
  before_action :find_geek, only: [:show]
  def index
    @geeks = Geek.all
  end

  def show
  end

  private

  def geek_params
    params.require(:geek).permit(:name, :photo)
  end  

  def find_geek
    @geek = Geek.find(params[:id])
  end
end
