class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy]

def set_reservation
  @reservation = Reservation.find(params[:id])
    
end

def index
  # This is mapped to reservations_path in routes file
  # This needs to pull All reservations from DB
  @reservations = Reservation.order(:reserved_on).page(params[:page])
  @book = Book.find(4)
  @reservation = Reservation.find(1)

end

def show
  @reservation = Reservation.find(1)
  @book = Book.find(4)
end
  # This is mapped to reservation_path in routes file 
  # TODO: Need to write a query to pull back Reservations for this user_id
  


def new
  @book = Book.new
  @reservation = @book.reservations.new
end

def create
  #@reservation = Reservation.new(reservation_params)
  @book = Book.find(4)
  @user = User.find(1)
  @reservation = @book.reservations.new(reservation_params)
  if @reservation.save
    redirect_to @reservation, notice: "#{@reservation.reserved_on} was created!"
  else
    render :new
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
  @reservation = Reservation.find(reservation_params[:id])
  @reservation.destroy
  redirect_to reservations_url
end

private

def reservation_params
  params.require(:reservation).permit(:user_id, :book_id , :reserved_on , :due_on)
end


end
