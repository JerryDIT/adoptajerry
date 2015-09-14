require Rails.root.join('app/interactions/jerries/create_jerry')
require Rails.root.join('app/interactions/jerries/update_jerry')

class JerriesController < ApplicationController
  before_action :find_jerry, except: [:new, :create, :index, :roulette]
  before_action :maker_authenticate, except: [:index, :show, :roulette]
  before_action :check_maker_clearance, only: [:edit, :update, :edit_team]

  def new
    @jerry = Jerry.new
    @jerry.organs.build
    @jerry.skills.build
    @jerry.pictures.build
  end

  def create
    outcome = CreateJerry.run(
      params: params[:jerry],
      maker: current_maker,
      images: params[:jerry][:pictures][:image])

    if outcome.valid?
      redirect_to jerry_path outcome.result
    else
      render :new
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
    update_team
    outcome = UpdateJerry.run(
      jerry: @jerry,
      params: params[:jerry],
      images: params[:jerry][:pictures][:image])

    if outcome.valid?
      redirect_to jerry_path outcome.result
    else
      render :edit
    end
  end

  def destroy
    @jerry.destroy
    redirect_to jerries_path
  end

  def edit_team
  end

  def roulette
    rand_id = Jerry.ids.shuffle.first
    @jerry = Jerry.find(rand_id)
    redirect_to @jerry
  end

  private

  def find_jerry
    @jerry = Jerry.find params[:id]
  end

  def maker_authenticate
    redirect_to root_path, notice: 'Please Sign in first --→' unless current_maker
  end

  def check_maker_clearance
    if @jerry.makers.include? current_maker
      # all right you can continue
    else
      redirect_to @jerry, notice: 'You can not edit this Jerry'
    end
  end

  def update_team
    if params[:jerry][:makers]
      new_maker = Maker.find_by :uid => params[:jerry][:makers][:uid]
      if new_maker
        @jerry.makers << new_maker
      else
        flash.now.notice = "Unknown maker '#{params[:jerry][:makers][:uid]}', can not be added to the team"
        return render 'edit_team'
      end
    end
  end

end
