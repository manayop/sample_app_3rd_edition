require 'actions/show_users'
require 'actions/show_microposts'
require 'actions/prepare_new_user'
require 'actions/create_user'
require 'actions/update_user'
require 'actions/destroy_user'

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = Actions::ShowUsers.do params[:page]
  end
  
  def show
    result = Actions::ShowMicroposts.do params[:id], params[:page]
    @user = result
    @microposts = result.microposts
    @pagination = result.pagination
  end
  
  def new
    @user = Actions::PrepareNewUser.do
  end
  
  def create
    create_new_user user_params
  rescue Exception
    repopulate_form user_params
  end
  
  def edit
  end
  
  def update
    action_ok = Actions::UpdateUser.do @user, user_params
    if action_ok
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    Actions::DestroyUser.do params[:id]
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private

  def repopulate_form data
    @user = Actions::PrepareNewUser.do data
    render 'new'
  end

  def create_new_user data
    @user = Actions::CreateUser.do(data)
    flash[:info] = "Please check your email to activate your account."
    redirect_to root_url
  end
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # Before filters
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
