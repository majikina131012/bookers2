class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end
  
  def create
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to books_path notice:"予約が完了しました"
  end
  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :book_id)
  end
end
