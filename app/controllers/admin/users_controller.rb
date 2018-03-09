class Admin::UsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy, :edit_password]

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

  def destroy
    respond_to do |format|
      if @user.destroy
        flash.now[:notice] = 'successfully_destroyed'
        format.html { redirect_to admin_users_url }
      else
        format.html { render :index }
      end
    end
  end

  def edit_password
  end

  def update_password
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        bypass_sign_in(@user)
        flash.now[:notice] = 'successfully_updated'
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
              :locale,
      )
    end
end
