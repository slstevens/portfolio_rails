class ProjectsController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]
	load_and_authorize_resource param_method: :project_params 
	skip_authorize_resource :only => [:index, :show]


	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end


	def create
		@project = Project.new(project_params)
		@project.user = current_user
		if @project.save
			redirect_to projects_path
		else
			render 'new'
		end
	end

	def show
		@project = Project.find(params[:id])
		@project_image = ProjectImage.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)
		redirect_to '/projects'
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		flash[:notice] = 'Project deleted successfully'
		redirect_to '/projects'
	end

	def project_params
		params.require(:project).permit(:title, :description, :image, :address, :longitude, :latitude)
	end



end
