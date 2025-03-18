class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end

  def self.reservations_after_three_month
    reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

  def date_current_today
    errors.add(:day, "は本日以降の日付を選択してください。") if day < Date.current
  end
  

  def date_three_month_end
    errors.add(:day, "は3ヶ月以降の日付は選択できません") if (Date.current >> 3) < day
  end
end