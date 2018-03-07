class Admin::UsersController < AdminController
  before_action :set_admin_user

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
        UserMailer.welcome(@user, generated_password).deliver
        flash.now[:notice] = 'successfully_created'
        format.html { redirect_to admin_users_url }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      @user.roles = []
      @user.add_role params[:user][:roles]
      if @user.update(user_params)
        flash.now[:notice] = 'successfully_updated'
        format.html { redirect_to admin_users_url }
      else
        format.html { render :edit }
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
              :first_name,
              :last_name,
              :avatar,
              :phone,
              :locale,
              :username
      )
    end
end
