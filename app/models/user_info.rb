class UserInfo < ActiveRecord::Base

	belongs_to :user, validate: true

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :user_id, presence: true, uniqueness: true
	validates :gender, presence: true
	validates :user, presence: true

end
