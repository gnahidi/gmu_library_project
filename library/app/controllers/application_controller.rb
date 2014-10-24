class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authorize
  #...
  protected
  def authorize
  	unless User.find_by(id: session[:id])
  		redirect_to login_url, notice: "Please log in:"
  	end
  end

  def get_my_user
    User.find session[:id]
  end

end


  #protect_from_forgery with: :exception
