class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_date
      t.date :day, null: false
      t.string :time, null: false

      t.timestamps
    end
  end
end
