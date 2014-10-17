class SessionsController < ApplicationController
<<<<<<< HEAD
  skip_before_action :authorize

=======
>>>>>>> 8d3127353a32a2e795c348863962c4265cfa31b3
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
<<<<<<< HEAD
  		session[:user_id] = user.user_id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"  		
    end
=======
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
>>>>>>> 8d3127353a32a2e795c348863962c4265cfa31b3
  end

  def destroy
  	session[:user_id] = nil
<<<<<<< HEAD
  	redirect_to admin_url, notic: "Logged out"
=======
  	redirect_to store_url, notice: "Logged out"
>>>>>>> 8d3127353a32a2e795c348863962c4265cfa31b3
  end
end
