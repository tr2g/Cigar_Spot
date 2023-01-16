class ApplicationController < ActionController::Base
# ↓※あとでコメントアウト外す
#  protect_from_forgery with: :exception
#  before_action :authenticate_reviewer!, except: [:top, :about]
#  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :email, :password, :password_confirmation, :is_deleted])
    end


  private

    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        admin_root_path
      else
        flash[:notice] = "ログインしました"
        root_path
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :reviewer
        root_path
      elsif resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
    end

end