class MakersController < ApplicationController

  def locale
    name = params[:name]
    if @locales.include?(name)
      if maker_signed_in?
        current_maker.locale = name
        current_maker.save
      else
        session[:locale] = name
      end
    end
    redirect_to root_path(changed: true)
  end

  def show
    @maker = Maker.find params[:id]
    @jerries = @maker.jerries
  end
end
