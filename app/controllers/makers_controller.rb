class MakersController < ApplicationController
  def edit
    @maker = current_maker
  end

  def update
    @maker = current_maker
    if @maker.update maker_params
      redirect_to root_url, notice: 'Makername successfuly updated!'
    else
      render 'edit', notice: "#{maker_params} is already taken !"
    end
  end

  private
  def maker_params
    params.require(:maker).permit(:name)
  end
end
