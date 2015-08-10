class UserInfosController < ApplicationController

before_action :set_userinfo
layout "controller_layouts"
respond_to :html


def new 
	@userinfo=UserInfo.new
	respond_with(@userinfo)
end



def create
	var=params[:user_info]
	@email=current_user.email
	temp=var[:dd].to_s+"-"+var[:mm].to_s+"-"+var[:yr].to_s
	temp=Date.parse(temp)
	UserInfo.create(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp, department: var[:department], 
			designation: var[:designation])
	respond_with(@user_info)
end



def show
	@userinfo=UserInfo.find_by(user_id: current_user.id)
end


def edit
	respond_with(@userinfo)
end


def send_image
	#@user_image=userinfo_exist?
	#send_data @user_image.image , type: 'img/png', disposition: 'inline', filename: @user_image.image_name
end


def update
	var=params[:user_info]
	@email=current_user.email
	temp=var[:dd].to_s+"-"+var[:mm].to_s+"-"+var[:yr].to_s
	temp=Date.parse(temp)
	@userinfo.update(user_id: current_user.id, first_name: var[:first_name], 
			last_name: var[:last_name], phone: var[:phone], gender: var[:gender], city: var[:city], 
			zipcode: var[:zipcode], dob: temp, department: var[:department], 
			designation: var[:designation])

	respond_with(@userinfo)	
end


private
	def set_params
		params.require(:userinfo).permit!
	end

	def set_userinfo
		@userinfo=UserInfo.find_by(user_id: current_user.id)
		@email=User.find(current_user.id).email
	end

end
