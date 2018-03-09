# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user_id, password)
    @user = User.find(user_id)
    @password = password
    mail(to: @user.email,
         subject: t('welcome_user', user: @user.username))
  end
end
