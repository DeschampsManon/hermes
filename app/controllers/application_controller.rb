# frozen_string_literal: true

class ApplicationController < ActionController::Base
    layout :layout_by_resource
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale
    protect_from_forgery with: :exception

    def set_locale
        I18n.locale = if current_user.present? && current_user.locale?
                          current_user.locale
                      else
                          extract_locale_from_accept_language_header || I18n.default_locale
                      end
    end

    protected

    def configure_permitted_parameters
        added_attrs = %i[first_name
                         last_name
                         username
                         description
                         address
                         zip_code
                         city
                         country
                         phone
                         locale
                         email
                         role_id
                         password
                         password_confirmation
                         remember_me]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    private

    def layout_by_resource
        if devise_controller?
            'devise'
        else
            'application'
        end
    end

    def extract_locale_from_accept_language_header
        request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end
end
