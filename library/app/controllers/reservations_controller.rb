class ReservationsController < ApplicationController
  #before_action :set_reservation, only: [:edit, :update, :destroy]

#def set_reservation
#  @reservation = Reservation.find(params[:id])
#end

def index
  # This is mapped to reservations_path in routes file
  # This needs to pull All reservations from DB
  #@reservations = get_my_user.reservations.order(:reserved_on).page(params[:page])
  @reservations = Reservation.joins(:book).where('user_id = ?', session[:id]).order(:reserved_on).page(params[:page]) 
end

#def show
#  @reservation = Reservation.find(params[:id])
#  @book = Book.find(params[:id])
#end

def create
  #book = Book.find(params[:book_id])
  #user = get_my_user
  #reservation = user.reservations.new(book: book)
  @book = Book.find(params[:book_id])
  @book.total_in_library = @book.total_in_library - 1
  @user = User.find(session[:id])
  @reservation = Reservation.new(user_id: @user.id, book_id: @book.id)
  if @reservation.save and @book.save
    redirect_to reservations_path, notice: "#{@reservation.reserved_on} You successfully reserved #{@book.title}"
  else
    redirect_to book, error: "Something went wrong ..."
  end
end

def edit
end

def update
  if @reservation.update(reservation_params)
    redirect_to @reservation, notice: "#{@reservation.reserved_on} was updated!"
  else
    render :new
  end
end

def destroy
  #@reservation = Reservation.find(reservation_params[:id])
  #@reservation.destroy
  #redirect_to reservations_url
  @reservation = Reservation.find(params[:id])
    @reservation.destroy
    respond_to do |format|
      @book = Book.find(params[:book_id])
      @book.total_in_library = @book.total_in_library + 1

      if @book.save
        format.html { redirect_to user_reservations_path(session[:user_id]), notice: "#{@book.title} was returned successfully." }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
end

def overdue
end


end
