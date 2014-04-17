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
      redirect_to root_url, notice: 'Makername successfuly updated!'
    else
      render 'edit', notice: "#{maker_params[:name]} is already taken !"
    end
  end

  private

  def maker_params
    params.require(:maker).permit(:name)
  end
end
