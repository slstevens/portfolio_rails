class ProfilesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@profile = Profile.new
	end

	def create
		@user = User.find(params[:user_id])

		@profile = @user.build_profile(profile_params)
		@profile.save
		# redirect_to root_path
		redirect_to user_profile_path(@user)
	end

	def show
		@user = User.find(params[:user_id])
		@profile = @user.profile
		@projects = @user.projects
		# @projects = @user.projects.find(params[@user.id])
	end

	private

	def profile_params
		params.require(:profile).permit(:name, :description, :address, :longitude, :latitude, :image, :website_address) 
	end

end
