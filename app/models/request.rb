class Request < ActiveRecord::Base
	has_many :notification

	def self.inqueue
		Request.where(status: 4)
	end

	def self.completed
		Request.where.not(status: 4)
	end
end
