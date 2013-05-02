class User < ActiveRecord::Base
  attr_accessible :username, :provider, :uid, :first_name, :last_name, :email, :avatar

  def self.where_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.avatar = auth.info.image
    end
  end
end

