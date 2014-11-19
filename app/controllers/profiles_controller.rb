class ProfilesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@profile = Profile.new
	end

	def create
		@user = User.find(params[:user_id])
		# @profile = Profile.new(profile_params)
		# @user.profile = @profile.save
		# redirect_to root_path
		@user.profiles.create(profile_params)
		redirect_to root_path
	end

	private

	def profile_params
		params.require(:profile).permit(:name, :description, :address, :longitude, :latitude) 
	end

end
