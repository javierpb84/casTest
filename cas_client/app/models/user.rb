class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:cas]

  def self.from_omniauth(auth)
    where(provider: 'cas', email: auth['uid']).first_or_create do |user|
      user.email = auth['uid']
      user.provider = 'cas'
      user.password = Devise.friendly_token[0,20]
    end
  end

end
