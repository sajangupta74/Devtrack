
#code for creating predefined-status
	status=Status.exists?(1)
	if status == false
		puts ">Generating statuses code"
		statuses=Array.new
		statuses[0] = Status.create(id: 1, status_name: "available")
		statuses[1] = Status.create(id: 2, status_name: "not available")
		statuses[2] = Status.create(id: 3, status_name: "using")
		statuses[3] = Status.create(id: 4, status_name: "requested")		
	else
		#do nothing
	end


#code for generating allowed activities
	activity=Activity.exists?(1)
	if activity == false
		puts ">Generating allowed activities"
		activities=Array.new
		activities[0] = Activity.create(id: 1, description: "request for device")
		activities[1] = Activity.create(id: 2, description: "admin accepted request")
		activities[2] = Activity.create(id: 3, description: "admin rejected request")
		activities[3] = Activity.create(id: 4, description: "time up, return the device")
	else
		#do nothing
	end



#calling methods to generate admin user
	user=User.exists?(1)
	if user==false
		puts ">Generating admin"
		User.connection
		User.create_admin
	else
		#do nothing
	end

#calling method to seed devicetype table
	devicetype=DeviceType.exists?(1)
	if devicetype == false
		puts ">Generating devicetype"
		DeviceType.connection
		DeviceType.create_device_types
	else
		#do nothing
	end