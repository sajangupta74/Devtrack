

require 'sqlite3'

#getting current time
	current_time = Time.now

i=0
arr_id = Array.new
arr_device_id = Array.new
arr_time = Array.new
arr_device_id_recovered = Array.new

SQLite3::Database.open( "../db/development.sqlite3" ) do |db|
  
	  i=0																	# counter for all arrays

	  db.execute( "select id,device_id,time from device_queues" ) do |id,d_id,time|
	    arr_id[i] = id
	    arr_device_id[i] = d_id
	    arr_time[i] = Time.parse(time)
	    i=i+1
	  end

	  	t=0																	# counter for arr_device_id_recovered

	  																		# K is another counter 
	 for k in 0...i
	  	time_diff = current_time-arr_time[k]

		if ( time_diff >= 7200)
			arr_device_id_recovered[t] = arr_device_id[k]
	  		query= "delete from device_queues where id='#{arr_id[k]}'"		# query for deleting over timed devices from
	  		db.execute(query)												# device_queues table
	  		t=t+1
	  	end

	  end


	 for i in 0...arr_device_id_recovered.length
		query="update devices set status_id=1 where id='#{arr_device_id_recovered[i]}'"
		status=db.execute(query)
		puts status
	 end   


end