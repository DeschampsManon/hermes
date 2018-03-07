class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery with: :exception

  private
      def layout_by_resource
          if devise_controller?
              'devise'
          else
              'application'
          end
      end

  protected
      def configure_permitted_parameters
          added_attrs = [:first_name,
                         :last_name,
                         :username,
                         :description,
                         :address,
                         :zip_code,
                         :city,
                         :country,
                         :phone,
                         :locale,
                         :email,
                         :role_id,
                         :password,
                         :password_confirmation,
                         :remember_me]
          devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
          devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
