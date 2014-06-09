class MakersController < ApplicationController
  def show
    @maker = Maker.find(params[:id])
    @jerries = @maker.jerries
  end

  def edit
    @maker = current_maker
  end

  def update
    @maker = current_maker
    if @maker.update maker_params
      redirect_to maker_path(@maker)
    else
      flash.now.notice = "#{maker_params[:name]} is not available! please choose a new name"
      render 'edit'
    end
  end

  private

  def maker_params
    params.require(:maker).permit(:name, :city, :bio)
  end
end
