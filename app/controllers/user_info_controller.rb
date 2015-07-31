class UserInfoController < ApplicationController

layout "controller_layouts"

def overview
	@user=userinfo_exist?
	@email=User.find(current_user.id).email
end

def update
	var=params[:info]
	@email=current_user.email
	temp=var[:dd].to_s+"-"+var[:mm].to_s+"-"+var[:yr].to_s
	temp=Date.parse(temp)

	user=userinfo_exist?

	if user === false
		user=UserInfo.create(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp)
		redirect_to devices_path
	else
		user.update(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp)
		redirect_to devices_path
	end
end

def userinfo_exist?
	user=UserInfo.find_by(user_id: current_user.id)
	if user == nil
		return false
	else
		return user
	end
end


private
	def set_params
		params.require(:info).permit!
	end

end
