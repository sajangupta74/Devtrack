class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable



  def self.from_google_auth(auth)
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
      user.is_admin = 0
    end
  end

  def self.create_admin

    error = create do |user|
      user.provider = "DevTrack"
      user.uid = 1
      user.email = "admin@admin.com"
      user.password = "admin123"
      user.reset_password_token = Devise.friendly_token[0,10]
      user.sign_in_count = user.sign_in_count + 1
      user.current_sign_in_at = DateTime.now
      user.last_sign_in_at = DateTime.now
      user.is_admin = 1
    end

  end

  def self.user_exist?(username, password)
    user = find_by_email(username)

    if user != nil
      status = user.valid_password?(password)
      if status == true
        return user
      else
        return "Invalid Password"
      end
    else
      return "User not exist"
    end
  end

end
