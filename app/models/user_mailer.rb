class UserMailer < ApplicationMailer
    layout 'admin/mailers/welcome'

    def welcome(user_id, password)
        @user = User.find(user_id)
        @password = password
        mail(
            to: @user.email,
            from: 'hermes@mailer.co',
            subject: t('welcome_user', user: @user.username)
        )
    end
end
