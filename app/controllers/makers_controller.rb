class MakersController < ApplicationController
  def show
    @maker = Maker.find params[:id]
    @jerries = @maker.jerries
  end
end
