class CitiesController < ApplicationController
  before_action :find_city, only: [:show, :edit, :destroy]

  def index
    @cities = City.all
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def find_city
    @city = City.find(params[:id])
  end
end
