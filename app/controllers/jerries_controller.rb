require 'carrierwave/orm/activerecord' # to be removed?

class JerriesController < ApplicationController

  def new
    @jerry = Jerry.new
  end
  def create
    @jerry = Jerry.new(jerry_params)
    if @jerry.save
      redirect_to @jerry
    else
      render 'new'
    end
  end
  def show
    @jerry = Jerry.find(params[:id])    
  end
  def index
    @jerries = Jerry.all
  end
  def edit
    @jerry = Jerry.find(params[:id])
  end
  def update
    @jerry = Jerry.find(params[:id])

    if @jerry.update(params[:jerry].permit(:name, :bio, :avatar))
      redirect_to @jerry
    else
      render 'edit'
    end
  end
  def destroy
    @jerry = Jerry.find(params[:id])
    @jerry.destroy
    redirect_to jerries_path
  end

  private
    def jerry_params
      params.require(:jerry).permit(:name, :bio, :avatar)
  end
end
