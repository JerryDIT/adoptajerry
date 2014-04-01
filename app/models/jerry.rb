class Jerry < ActiveRecord::Base
  has_many :organs, dependent: :destroy
  validates_associated :organs
  accepts_nested_attributes_for :organs, allow_destroy: true

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
  mount_uploader :avatar, AvatarUploader
end
