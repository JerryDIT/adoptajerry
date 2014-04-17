class Jerry < ActiveRecord::Base
  has_many :organs, dependent: :destroy
  validates_associated :organs
  accepts_nested_attributes_for :organs, allow_destroy: true

  has_many :skills, dependent: :destroy
  validates_associated :skills
  accepts_nested_attributes_for :skills, allow_destroy: true

  has_and_belongs_to_many :makers
  
  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
  mount_uploader :avatar, AvatarUploader
end
