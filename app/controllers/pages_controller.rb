class PagesController < ApplicationController
	def index
		@projects = Project.all
		# @users = User.all

		if params[:search].present?
			@profiles = Profile.near(params[:search], 50, :order => :distance)
		else
			@profiles = Profile.all
		end

	end

	def about
	end

end
