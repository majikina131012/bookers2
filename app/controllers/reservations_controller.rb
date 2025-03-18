class ReservationsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def index
    @book = Book.find(params[:book_id])
    # @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    @reservations = Reservation.where(book_id: @book.id)
                           .where("day >= ?", Date.current)
                           .where("day < ?", Date.current >> 3)
                           .order(day: :desc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def create
    book = Book.find(params[:book_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.book_id = book.id
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to book_reservation_path(book.id,@reservation.id), notice: "予約が完了しました"
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:day, :time, :user_id, :start_time)
  end
end
