require Rails.root.join('app/interactions/jerries/create_jerry')
require Rails.root.join('app/interactions/jerries/update_jerry')

class JerriesController < ApplicationController
  before_action :find_jerry, except: [:new, :create, :index, :roulette]
  before_action :authenticate_maker!, except: [:index, :show, :roulette]
  before_action :check_maker_clearance, only: [:edit, :update, :edit_team]

  def new
    @jerry = Jerry.new
    @jerry.organs.build
    @jerry.skills.build
    @jerry.pictures.build
  end

  def create
    images = if params[:jerry][:pictures].present?
               params[:jerry][:pictures][:image]
             else
               []
             end
    outcome = CreateJerry.run(
      params: params[:jerry],
      maker: current_maker,
      images: images)

    if outcome.valid?
      redirect_to jerry_path outcome.result
    else
      @jerry = outcome.result
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
    images = if params[:jerry][:pictures].present?
               params[:jerry][:pictures][:image]
             else
               []
             end

    outcome = UpdateJerry.run(
      jerry: @jerry,
      params: params[:jerry],
      images: images)

    if outcome.valid?
      redirect_to jerry_path outcome.result
    else
      @jerry = outcome.result || @jerry
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

  def check_maker_clearance
    unless @jerry.makers.include? current_maker
      redirect_to @jerry, notice: 'You can not edit this Jerry'
    end
  end

  def update_team
    if params[:jerry][:makers]
      new_maker = Maker.find_by email: params[:jerry][:makers][:uid]
      if new_maker
        @jerry.makers << new_maker
      else
        flash.now.notice = "Unknown maker '#{params[:jerry][:makers][:uid]}', can not be added to the team"
      end
    end
  end

end
