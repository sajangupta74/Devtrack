class UserInfoController < ApplicationController

before_action :set_userinfo
layout "controller_layouts"
respond_to :html


def show	
	@userinfo=userinfo_exist?
	
	if @userinfo == false
		render 'overview_new_user'
	else
		@email=User.find(current_user.id).email
		render 'overview'
	end
end


def edit
	render 'overview'
end


def send_image
	@user_image=userinfo_exist?
	send_data @user_image.image , type: 'img/png', disposition: 'inline', filename: @user_image.image_name
end


def update
	var=params[:user_info]
	@email=current_user.email
	temp=var[:dd].to_s+"-"+var[:mm].to_s+"-"+var[:yr].to_s
	temp=Date.parse(temp)
	@userinfo.update(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp, department: var[:department], designation: var[:designation])


=begin
	@userinfo=userinfo_exist?

	if @userinfo === false
		@userinfo=UserInfo.create(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp, department: var[:department], designation: var[:designation])
			#image_name: var[:photo].original_filename)
			
			
#getting uploaded profile image from browser

			@userinfo.update(image: var[:photo].read)
			f1=File.open("public/#{var[:photo].original_filename}","wb")
			f1.write(var[:photo].read)
			f1.close

		respond_with(@userinfo)
	else

			@userinfo.update(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp, department: var[:department], designation: var[:designation], 
			image_name: var[:photo].original_filename)
		

#getting uploaded profile image from browser

			@userinfo.update(image: var[:photo].read)
			f1=File.open("public/temp.jpg","wb")
			f1.write(@userinfo.image)
			f1.close
=end
		respond_with(@userinfo)

	
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
		params.require(:userinfo).permit!
	end

	def set_userinfo
		@userinfo=UserInfo.find_by(user_id: current_user.id)
	end

end
