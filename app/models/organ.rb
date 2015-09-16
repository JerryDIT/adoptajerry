class Organ < ActiveRecord::Base
  belongs_to :jerry
  validates :role, presence: true
  validates :quantifier, numericality: true
  validates :unit, presence: true
end
