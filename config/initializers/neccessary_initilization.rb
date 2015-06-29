
#code for creating predefined-status
	puts ">Generating statuses code"
	status=Status.exists?(1)
	if status == false
		statuses=Array.new
		statuses[0] = Status.create(id: 1, status_name: "available")
		statuses[1] = Status.create(id: 2, status_name: "not available")
		statuses[2] = Status.create(id: 3, status_name: "using")
	else
		#do nothing
	end



#calling methods to generate admin user
	puts ">Generating admin"
	User.connection
	User.create_admin

