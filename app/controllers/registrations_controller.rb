# Depends on registration controller that is in devise
class RegistrationsController < Devise::RegistrationsController

  private

  # Allowing a new parameter to be passed when a user signs up for an account
  # Only allows things that are permitted
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  # Method for updating User accounts (Default devise methods)
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end