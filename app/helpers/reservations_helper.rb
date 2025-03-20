module ReservationsHelper
  def times
    times = ["9:00",
             "9:30",
             "10:00",
             "10:30",
             "11:00",
             "11:30",
             "13:00",
             "13:30",
             "14:00",
             "15:00",
             "15:30",
             "16:00",
             "16:30"]
  end

  def check_reservation(reservations, day, time)
    if day < Date.current
      return true
    end
    reservations.any? do |reservation|
      reservation.day == day && reservation.time == time
    end
  end
  
end
