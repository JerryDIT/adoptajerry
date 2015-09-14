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
    hash :skills_attributes, strip: false
  end
  array :images
  object :maker

  def execute
    create_jerry
    associate_maker
    compose(AddPicturesToJerry, images: images, jerry: @jerry)
    @jerry
  end

  private

  def create_jerry
    @jerry = Jerry.new(params)
    errors.merge!(@jerry.errors) unless @jerry.save
  end

  def associate_maker
    maker.jerries << @jerry
  end
end
