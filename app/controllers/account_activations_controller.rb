require 'actions/activate_user'

class AccountActivationsController < ApplicationController
  
  def edit
    user = Actions::ActivateUser.do params[:id],params[:email]
    if user
      log_in user 
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
