class AuthorsController < ApplicationController

  #skip_before_action :authorize
  before_action :set_author, only: [ :show, :edit, :update, :destroy ]
  
  def set_author
    @author = Author.find(params[:id])
  end

  def index
  	@available_at = Time.now
  	@authors = Author.order(:name).page(params[:page])
  end

  def show
  end

  def new
    if session[:admin]
  	@author = Author.new
  else
    redirect_to books_path, notice: "Please log in as admin"
  end
  end

  def create
    if session[:id] and session[:admin]
      @author = Author.new(author_params)
      if @author.save
        redirect_to @author, notice: "#{@author.name} was created!!"
      else
        render :new
      end
    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  def edit
    if session[:id] and session[:admin]

    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  def update
    if session[:id] and session[:admin]
      if @author.update(author_params)
        redirect_to @author, notice: "#{@author.name} was updated!!"
      else
        render :new
      end
    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  def destroy
    if session[:id] and session[:admin]
      if @author.books.empty?
        @author.destroy
        logger.debug "destroying #{@author.name}"
        redirect_to authors_url, notice: "#{@author.name} was deleted!!"
      else
        logger.debug "NOT destroying #{@author.name}"
        flash[:error] = "#{@author.name} cannot be deleted ... books still exist"
        redirect_to @author
      end
    else
      redirect_to books_path, notice: "Please log in as admin"
    end
  end

  private

  def author_params
  	params.require(:author).permit(:name, :dob, :nationality, :awards, :biography, :image_url)
  end

end

