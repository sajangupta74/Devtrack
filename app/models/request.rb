class Request < ActiveRecord::Base
	has_one :notification
	has_one :device, class_name: "Device", primary_key: "device_id", foreign_key: "id"

	belongs_to :user, class_name: "User", foreign_key: "sender_id"
	belongs_to :user, class_name: "User", foreign_key: "reciever_id"
	def self.inqueue
		Request.where(status: 4)
	end

	def self.completed
		Request.where.not(status: 4)
	end
end
