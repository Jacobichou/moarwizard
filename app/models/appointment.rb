class Appointment < ActiveRecord::Base
   # after_save ApptCallbacks.new
   # Appointment stores who the appointment is for using user_id.
   # rescheduled is an integer: {0 = no, 1 = yes, 6 = canceled}
   # attending_physician indicates the id of the physician/pa to be seen
   # time and date are stored as datetime objects

   has_many :users
   default_scope -> { order('apt_date DESC', 'apt_time ASC') }

   class ApptCallbacks
     def after_save(record)
       record.destroy
     end

     alias_method :after_initialize, :after_save
   end

end
