class NeighborhoodsController < ApplicationController
  before_action :find_nbd, only: [:show, :edit, :destroy]
  
  def index
    @neighborhoods = Neighborhood.all
  end

  def show
  end

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.new(neighborhood_params)
    @neighborhood.save
    redirect_to neighborhood_path(@neighborhood)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_nbd
    @neighborhood = Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:neighborhood_name, :city_id)
  end
end

