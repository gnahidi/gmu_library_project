class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
  	user = User.find_by(user_id: params[:user_id])
  	if user and user.authenticate(params[:password]) and user.admin
  		session[:id] = user.id
      session[:admin] = true
  		redirect_to books_url
  	elsif user and user.authenticate(params[:password])
      session[:id] = user.id
      session[:admin] = false
      redirect_to books_url
    else
  		redirect_to login_url, alert: "Invalid user/password combination"  		
    end
  end

  def destroy
  	session[:id] = nil
  	redirect_to login_url, notice: "Logged out"
  end
end
