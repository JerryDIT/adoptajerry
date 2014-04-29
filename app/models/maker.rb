class Maker < ActiveRecord::Base
  has_and_belongs_to_many :jerries
  
  validates :uid, presence: true
  validates :uid, uniqueness: true
  validates :provider, presence: true
  validates :name, uniqueness: true

  def self.create_with_omniauth(auth)
    create! do |maker|
      maker.provider = auth[:provider]
      maker.uid = auth[:uid]
      maker.name = auth[:info][:name] ? auth[:info][:name].split('@')[0][0..6] + '-' + rand(36**3).to_s(36) : rand(36**5).to_s(36)
    end
  end
end
