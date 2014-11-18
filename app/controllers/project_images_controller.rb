class ProjectImagesController < ApplicationController

	def create 
		@project = Project.find(params[:project_id])
		@project.project_images.create(project_image_params)
		redirect_to project_path(@project)
		# @project_image = ProjectImage.new(project_image_params)
	end

	private

	def project_image_params
		params.require(:project_image).permit(:caption, :image)
	end
end
