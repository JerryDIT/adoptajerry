require 'active_interaction'

class AddPicturesToJerry < ActiveInteraction::Base
  array :images
  object :jerry

  def execute
    add_pictures
    jerry.pictures
  end

  private

  def add_pictures
    images.each do |image|
      jerry.pictures.create(image: image)
    end
  end
end
