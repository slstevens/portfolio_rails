class CommentsController < ApplicationController
	def new
		@project = Project.find(params[:project_id])
		@comment = Comment.new
	end

	def create
		@project = Project.find(params[:project_id])
		@project.comments.create(comment_params)
		redirect_to projects_path
	end

	def comment_params
		params.require(:comment).permit(:comment)
	end

end
