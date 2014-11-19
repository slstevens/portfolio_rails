class RegistrationsController < Devise::RegistrationsController

	protected

  def after_sign_up_path_for(user)
    new_user_profile_path(user)
  end

  private
 
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
 
  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :role)
  end
end