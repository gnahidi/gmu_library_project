class AuthorsController < ApplicationController

  def index
  	@available_at = Time.now
  	@authors = Author.all
  end

  def show
  	@author = Author.find(params[:id])
  end

end

