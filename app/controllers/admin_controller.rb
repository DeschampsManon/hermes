# frozen_string_literal: true

class AdminController < ApplicationController
    layout 'admin'

    before_action :authenticate_user!
    before_action :authorized?, if: :current_user

    private

    def authorized?
        redirect_to(root_url) unless current_user.has_role? :admin
    end
end
