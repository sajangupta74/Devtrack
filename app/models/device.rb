class Device < ActiveRecord::Base
	has_many :devicequeues
	has_many :users, through: :devicequeues
	
	belongs_to :request, class_name: "Request", foreign_key: "id", primary_key: "device_id"
end
