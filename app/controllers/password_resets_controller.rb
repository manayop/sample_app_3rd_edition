require 'actions/create_password_reset'
require 'actions/update_user'



class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = Actions::CreatePasswordReset.do params[:password_reset][:email]
    if @user
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end

  end
  
  def edit
  end
  
  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
      return
    end

    result_message = Actions::UpdateUser.do @user,user_params
    if result_message
      log_in @user
      flash[:success] = result_message
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
    
    # Returns true if password is blank.
    def password_blank?
      params[:user][:password].blank?
    end
  
    # Before filters
  
    def get_user
      @user = User.find_by(email: params[:email])
    end
    
    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? && 
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end      
    end
    
    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
