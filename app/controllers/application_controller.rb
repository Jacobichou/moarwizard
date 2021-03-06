class ApplicationController < ActionController::Base
   before_filter :configure_permitted_parameters, if: :devise_controller?

   # def update_sanitized_params
   #    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:dob, :phone, :address, 
   #                                                 :insurance)}
   # end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
   dashboard_path
  end

  protected

   def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] },
                                                       :email, :password, :password_confirmation, :current_password,
                                                       :dob, :phone, :address, :insurance, :insur_grp_id,
                                                       :insur_policy_acc) }
   end
end
