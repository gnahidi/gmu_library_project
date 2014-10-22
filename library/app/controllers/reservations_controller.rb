class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy]

def set_reservation
  @reservation = Reservation.find(params[:id])
    
end

def index
  # This is mapped to reservations_path in routes file
  # This needs to pull All reservations from DB
  @reservations = Reservation.order(:reserved_on).page(params[:page])
end

def show
  #@reservation = Reservation.find(params[:id])
  # This is mapped to reservation_path in routes file 
  # TODO: Need to write a query to pull back Reservations for this user_id
  
end

def new
  @reservation = Reservation.new
end

def create
  #@reservation = Reservation.new(reservation_params)
  @book = Book.find(params[:book_id])
  @user = User.find(params[:user_id])
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
  @reservation.destroy
  redirect_to reservation_url
end

private

def reservation_params
  params.require(:reservation).permit(:reserved_on)
end


end
