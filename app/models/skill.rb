class Skill < ActiveRecord::Base
  belongs_to :jerry
  validates :layer, presence: true
  validates :name, presence: true
  validates :url, presence: true
end
