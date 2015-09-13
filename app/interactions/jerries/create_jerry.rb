require 'active_interaction'

class CreateJerry < ActiveInteraction::Base
  hash :params do
    string :name
    string :bio
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
    add_pictures
    @jerry
  end

  private

  def create_jerry
    @jerry = Jerry.new(params)
    @jerry.save
  end

  def associate_maker
    maker.jerries << @jerry
  end

  def add_pictures
    images.each do |image|
      @jerry.pictures.create(image: image)
    end
  end
end
