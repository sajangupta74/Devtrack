class Notification < ActiveRecord::Base
	belongs_to :request, validate: true
	validates :sender_id, :user_id, :request, presence: true
	belongs_to :user, validate: true
end
