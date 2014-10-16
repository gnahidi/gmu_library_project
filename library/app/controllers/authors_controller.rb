class AuthorsController < ApplicationController

  def index
  	@available_at = Time.now
  	@authors = Author.all
  end

end

