class JerriesController < ApplicationController
  before_action :get_jerry, except: [:new, :create, :index]
  before_action :maker_authenticate, except: [:index, :show]

  def new
    @jerry = Jerry.new
    @jerry.organs.build
    @jerry.skills.build
  end

  def create
    @jerry = Jerry.new jerry_params
    if @jerry.save && current_maker.jerries << @jerry
      redirect_to @jerry
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @jerries = Jerry.all.reverse
  end

  def edit
    redirect_to @jerry, notice: 'You can not edit this Jerry' unless maker_allowed?
  end

  def update
    if maker_allowed?
      if @jerry.update jerry_params
        redirect_to @jerry
      else
        render 'edit'
      end
    else
      redirect_to @jerry, notice: 'You can not edit this Jerry'
    end
  end

  def destroy
    @jerry.destroy
    redirect_to jerries_path
  end

  private

  def get_jerry
    @jerry = Jerry.find params[:id]
  end

  def maker_authenticate
    redirect_to root_path, notice: 'You must be signed in' unless current_maker
  end

  def maker_allowed?
    @jerry.makers.include? current_maker
  end

  def jerry_params
    params.require(:jerry).permit(
      :name, 
      :bio,
      :location,
      :avatar, 
      organs_attributes:
        [:id, :role, :quantifier, :unit, :_destroy],
      skills_attributes:
        [:id, :layer, :name, :url, :_destroy]
    )
  end

end
