class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?

protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) << [:name, :location]
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :name, :visible, :location, :team_id, :paid) }
	end

	def check_if_admin
		if signed_in?
      	redirect_to :root, notice: 'You attempted to enter a restricted area!' unless current_user.admin?
      else
      	redirect_to :root
      end
   end

end