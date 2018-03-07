class UserMailer < ApplicationMailer
    layout 'welcome_mailer'

    def welcome(user_id, password)
        @user = User.find(user_id)
        @password = password
        mail(
            to: @user.email,
            from: '',
            subject: t('welcome_user', user: @user.username)
        )
    end

end
