class ReservationsController < ApplicationController
  def index
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
