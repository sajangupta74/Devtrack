class DeviceType < ActiveRecord::Base

	def self.create_device_types
		DeviceType.create(id: 1,device_type: "phone")
		DeviceType.create(id: 2,device_type: "tablet")
		DeviceType.create(id: 3,device_type: "desktop")
	end

end
