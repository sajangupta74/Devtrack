class RequestStatus < ActiveRecord::Base
	has_many :notifications
end
