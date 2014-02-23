class User < ActiveRecord::Base
  validates :uid, presence: true
  validates :provider, presence: true
  validates :name, uniqueness: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:name] ? auth[:info][:name].split('@')[0][0..6] + '-' + rand(36**3).to_s(36) : rand(36**5).to_s(36)
    end
  end
end
