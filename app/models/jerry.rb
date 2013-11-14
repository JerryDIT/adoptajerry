class Jerry < ActiveRecord::Base
  has_many :organs, dependent: :destroy
  validates_associated :organs

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
  mount_uploader :avatar, AvatarUploader
end
