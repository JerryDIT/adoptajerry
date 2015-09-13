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
      maker.set_name(auth[:info][:name])
    end
  end

  def set_name(email)
    if email
      self.name = email.split('@')[0][0..6] + '-' + rand(36**3).to_s(36)
      #=> 'myname-h9k' if email == 'myname@xmail.com' 
    else
      self.name = rand(36**5).to_s(36)
      #=> 'f8lk2'
    end
  end
end
