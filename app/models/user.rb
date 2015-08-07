class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
  :trackable, :validatable, :omniauthable

  has_many :DeviceQueue
  has_one :UserInfo

  def self.user_info(auth,user_id)

        info=auth.info
        extra=auth.extra

    #spliting firstname and lastname
        name=info.name
        name=name.split(" ")
        firstname=name[0]
        lastname=name[1]

    #finding date of birth
        #dob=extra.raw_info.birthday.to_s
        puts auth.to_yaml
        #dob=Date.parse(dob)  

    #getting image from google url
        require 'open-uri'
        open('public/image.png', 'wb') do |file|
          file << open(extra.raw_info.picture).read
        end

        UserInfo.create(user_id: user_id, first_name: firstname, last_name: lastname, gender: extra.raw_info.gender, 
        image_name: info.name )
  end


  def self.from_google_auth(auth)
    error = where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
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


   # current_user=User.find_by(email: auth.info.email)
   #userinfo=UserInfo.find_by(user_id: current_user.id)

    #if(userinfo != nil)
    #  User.user_info(auth,current_user.id)
    #end

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

