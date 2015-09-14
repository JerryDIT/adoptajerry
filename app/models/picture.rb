class Picture < ActiveRecord::Base
  belongs_to :jerry

  mount_uploader :image, AvatarUploader
end
