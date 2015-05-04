class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    #last_id = User.last.id
    error = where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      #user.id = last_id + 1
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.reset_password_token = Devise.friendly_token[0,10]
      user.sign_in_count = user.sign_in_count + 1
      user.current_sign_in_at = DateTime.now
      user.last_sign_in_at = DateTime.now
    end
  end
end


