class AdminController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :authorized?, if: :current_user
    before_action :set_locale
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_locale
        if current_user.present? && current_user.locale?
            I18n.locale = current_user.locale
        else
            I18n.locale = extract_locale_from_accept_language_header || I18n.default_locale
        end
    end

    private
        def authorized?
            if !current_user.has_role? :admin
                redirect_to(root_url)
            end
        end
end