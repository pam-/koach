class AuthController < ApplicationController
  def omniauth
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)  

    if user.present?
      @current_user = User.find_by(id: user.id)
      session[:user_id] = @current_user.id
      redirect_to root_path
    else
      flash[:error] = "We couldn't log you in. Please try again." 
      redirect_to login_path
    end
  end

  def login
  end

  def logout
    session[:user_id] = @current_user = nil

    redirect_to login_path
  end
end
