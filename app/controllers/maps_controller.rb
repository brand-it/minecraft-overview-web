class MapsController < ApplicationController
  def index
    @maps = Map.all
  end
  
  def show
    @map = Map.find(params[:id])
  end
  
  def edit
    @map = Map.find(params[:id])
  end
  
  def new
    @map = Map.new
  end
  
  def create
    @map = Map.new(params[:map])
    respond_to do |format|
      if @map.save
        format.html { redirect_to map_path }
      else
        format.html { render :new }
      end
    end
  end
end