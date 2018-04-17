# frozen_string_literal: true

class User < ApplicationRecord
    rolify
    devise :database_authenticatable,
           :registerable,
           :recoverable,
           :rememberable,
           :trackable,
           :validatable,
           authentication_keys: [:login]
    attr_accessor :login

    has_attached_file :avatar, styles: { small: '170x170', thumb: '50x50' }, default_url: '/assets/admin/no_avatar'
    validates_attachment_content_type :avatar, content_type: %r{/\Aimage\/.*\z/}
    validates :username, presence: :true, uniqueness: { case_sensitive: false }

    before_validation :set_username
    before_validation :user_default, on: :create

    def self.locales
        {
            en: {
                name: I18n.t('english')
            },
            fr: {
                name: I18n.t('french')
            }
        }
    end

    def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if login == conditions.delete(:login)
            where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
        elsif conditions[:username].nil?
            where(conditions).first
        else
            where(username: conditions[:username]).first
        end
    end

    private

    def set_username
        self.username = email.split(/@/)[0]
    end

    def user_default
        add_role Role.find(1).name.to_sym
        self.locale = I18n.locale
    end
end
