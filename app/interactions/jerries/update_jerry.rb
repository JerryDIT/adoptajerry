require 'active_interaction'
require_relative '../pictures/add_pictures_to_jerry'

class UpdateJerry < ActiveInteraction::Base
  object :jerry
  hash :params do
    string :name
    string :bio
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

  def execute
    jerry.update(params)
    compose(AddPicturesToJerry, images: images, jerry: jerry)
    jerry
  end
end
