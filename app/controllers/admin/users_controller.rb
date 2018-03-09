# frozen_string_literal: true

class Admin::UsersController < AdminController
  before_action :set_admin_user, only: %i[show
                                          edit
                                          update
                                          destroy
                                          edit_password]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      generated_password = Devise.friendly_token.first(8)
      @user.password = generated_password
      @user.add_role params[:user][:roles]
      if @user.save
        UserMailer.welcome_email(@user, generated_password).deliver
        flash[:success] = I18n.t('successfully_created',
                                 title: @user.username,
                                 controller_name: I18n.t('user'),
                                 flash_title: I18n.t('flash_title_created'))
        format.html { redirect_to admin_users_url }
      else
        flash[:error] = I18n.t('unsuccessfully_created',
                               errors: @user.errors.messages[:name][0],
                               flash_title: I18n.t('be_careful'))
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @user.roles = []
      @user.add_role params[:user][:roles]
      if @user.update(user_params)
        flash[:success] = I18n.t('successfully_updated',
                                 title: @user.username,
                                 controller_name: I18n.t('user'),
                                 flash_title: I18n.t('flash_title_updated'))
        format.html { redirect_to admin_users_url }
      else
        flash[:error] = []
        @user.errors.each do |attribute, error|
          flash[:error] << I18n.t('unsuccessfully_updated',
                                  errors: error,
                                  flash_title: I18n.t(attribute))
        end
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        flash[:success] = I18n.t('successfully_destroyed',
                                 title: @user.username,
                                 controller_name: I18n.t('user'),
                                 flash_title: I18n.t('flash_title_destroyed'))
        format.html { redirect_to admin_users_url }
      else
        format.html { render :index }
      end
    end
  end

  def edit_password; end

  def update_password
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        bypass_sign_in(@user)
        flash[:success] = I18n.t('successfully_updated',
                                 title: '',
                                 controller_name: I18n.t('your_password'),
                                 flash_title: I18n.t('flash_title_password'))
        format.html { redirect_to admin_home_index_url }
      else
        format.html { render :edit_password }
      end
    end
  end

  private

  def set_admin_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :username,
      :first_name,
      :last_name,
      :avatar,
      :phone,
      :locale
    )
  end
end
