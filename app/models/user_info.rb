class UserInfo < ActiveRecord::Base

	belongs_to :user, validate: true, class_name: "User"
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :user_id, presence: true, uniqueness: true
	validates :gender, presence: true

end
