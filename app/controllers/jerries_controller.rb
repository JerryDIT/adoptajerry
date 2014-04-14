class JerriesController < ApplicationController
  before_action :get_jerry, except: [:new, :create, :index]
  before_action :maker_authenticate, except: [:index, :show]

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
  end

  def index
    @jerries = Jerry.all
  end

  def edit
  end

  def update
    if @jerry.update(jerry_params)
      redirect_to @jerry
    else
      render 'edit'
    end
  end

  def destroy
    @jerry.destroy
    redirect_to jerries_path
  end

  private

  def get_jerry
    @jerry = Jerry.find(params[:id])
  end

  def maker_authenticate
    if current_maker
      @maker = current_maker
    else
      redirect_to root_path, notice: 'You must be signed in'
    end
  end

  def jerry_params
    params.require(:jerry).permit(:name, :bio, :avatar, organs_attributes: [:id, :role, :quantifier, :unit, :_destroy])
  end

end
