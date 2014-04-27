class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.datetime :apt_date
      t.datetime :apt_time
      t.integer :attending_physician
      t.integer :rescheduled

      t.timestamps
    end
  end
end
