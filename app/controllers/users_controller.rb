class UsersController < ApplicationController
  load_and_authorize_resource find_by: :username

  def index
    # overrides the users set by load_and_authorize_resource
    @users = User.paginate(page: params[:page])
  end

  def show
  end

  def new
  end

  def create
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Primer!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :username,
                                   :password, :password_confirmation)
    end
end
