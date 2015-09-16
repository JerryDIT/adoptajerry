require 'active_interaction'
require_relative '../pictures/add_pictures_to_jerry'

class CreateJerry < ActiveInteraction::Base
  hash :params do
    string :name
    string :bio
    string :mission
    string :location
    object :avatar,
      class: ActionDispatch::Http::UploadedFile,
      default: nil
    hash :organs_attributes, strip: false
    string :organs_improvment
    hash :skills_attributes, strip: false
    string :skills_improvment
  end
  array :images
  object :maker

  def execute
    create_jerry
    associate_maker if @jerry.valid?
    compose(AddPicturesToJerry, images: images, jerry: @jerry) if @jerry.valid?
    @jerry
  end

  private

  def create_jerry
    @jerry = Jerry.new(params)
    errors.merge!(@jerry.errors) unless @jerry.valid?
  end

  def associate_maker
    maker.jerries << @jerry
  end
end
