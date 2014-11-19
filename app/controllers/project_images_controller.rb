class ProjectImagesController < ApplicationController

	def create 
		@project = Project.find(params[:project_id])
		@project_image = @project.project_images.create(project_image_params)
		puts params
		# binding.pry
		# redirect_to project_path(@project)
		render nothing: true
	end

	private

	def project_image_params
		params.require(:project_image).permit(:caption, :image)
	end
end
