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
  
  def update
    @map = Map.find(params[:id])
    respond_to do |format|
      if @map.update_attributes(params[:map])
        format.html { redirect_to map_path, flash: { success: "Map #{map.name} has been successfully updated." } }
      else
        format.html { render :edit, flash: { error: "There is some missing information please correct before continuing." } }
      end
    end
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