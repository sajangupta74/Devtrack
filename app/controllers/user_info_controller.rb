class UserInfoController < ApplicationController

layout "controller_layouts"

def overview
	@user=userinfo_exist?
	if @user == false
		render 'overview_new_user'
	else
		@email=User.find(current_user.id).email
		render 'overview'
	end
	
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
			zipcode: var[:zipcode], dob: temp, department: var[:department], designation: var[:designation], 
			image_name: var[:photo].original_filename)
			
		user.update(image: var[:photo].read)
			f1=File.open("public/#{var[:photo].original_filename}","wb")
			f1.write(var[:photo].read)
			f1.close

			if var[:password] == var[:password_again]
				if var[:password] != nil
					User.update_password(current_user.id, var[:password])
				end
			else
				flash[:notice]="Password did not match"
			end

		redirect_to userinfo_path
	else
			user.update(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp, department: var[:department], designation: var[:designation], 
			image_name: var[:photo].original_filename)
			temp=var[:photo]

			user.update(image: temp.read)

			f1=File.open("public/temp.jpg","wb")
			f1.write(user.image)
			f1.close

		if var[:password] == var[:password_again]
			if var[:password] != nil
					User.update_password(current_user.id, var[:password])
			end
		else
			flash[:notice]="Password did not match"
		end

		redirect_to userinfo_path
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
