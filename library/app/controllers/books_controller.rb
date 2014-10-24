class BooksController < ApplicationController
	before_action :set_book, only: [:show, :edit, :update, :destroy]
	
def set_book
	@book = Book.find(params[:id])
end

def index
	term = params[:search]
	like_term = "%#{term}%"

	#logger.debug "term is: #{term}"
	#logger.debug "like_term is: #{like_term}"

	if term
    	the_books = Book.includes(:author).where( ["title like ? or isbn = ? or authors.name like ?", like_term, term, like_term ] )
    else
    	the_books = Book.all
    end
    @books = the_books.page(params[:page])
end

def show
	@book = Book.find(params[:id])
end

def new
	@book = Book.new
end

def create
	@book = Book.new(book_params)
	if @book.save
		redirect_to @book, notice: "#{@book.title} was created!"
	else
		render :new
	end
end

def edit
end

def update
	if @book.update(book_params)
		redirect_to @book, notice: "#{@book.title} was updated!"
	else
		render :new
	end
end

def destroy
	@book.destroy
	redirect_to books_url
end

private

def book_params
	params.require(:book).permit(:title,:author_id , :isbn, :abstract, :pages,:total_in_library,:genre,:published_on ,:image_cover_url )
end

end 
