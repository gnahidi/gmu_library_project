class AuthorsController < ApplicationController

  def index
  	@available_at = Time.now
  	@authors = Author.all
  end

  def show
  	@author = Author.find(params[:id])
  end

  def new
  	@author = Author.new
  end

  def create
  	@author = Author.new(author_params)
  	@author.save
  	redirect_to @author
  end

  def edit
  	@author = Author.find(params[:id])
  end

  def update
  	@author = Author.find(params[:id])
  	@author.update(author_params)
  	redirect_to @author
  end

  private

  def author_params
  	params.require(:author).permit(:name, :dob, :nationality, :awards, :biography, :image_url)
  end

end

