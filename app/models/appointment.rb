class Appointment < ActiveRecord::Base
   # Appointment stores who the appointment is for using user_id.
   # rescheduled is an integer: {0 = no, 1 = yes, 6 = canceled}
   # attending_physician indicates the id of the physician/pa to be seen
   # time and date are stored as datetime objects

   belongs_to: user

   
end
