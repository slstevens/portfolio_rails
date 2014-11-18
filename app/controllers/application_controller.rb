class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_url, :alert => exception.message
	end

	# 	if user_signed_in?
	# 		flash[:error] = "Not authorized to view this page"
	# 		session[:user_return_to] = nil
	# 		redirect_to root_url

	# 	else
	# 		flash[:error] = "You must first login to view this page"
	# 		session[:user_return_to] = request.url
	# 		redirect_to "/users/sign_in"
	# 	end
	# end
end
