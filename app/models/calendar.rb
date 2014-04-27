class Calendar < ActiveRecord::Base
   has_many :appointments

   # Calendar stores an appointment_id along the user_id for who the appointment
   # is for. Further implementatio of creation tracking and modification will
   # be saved for last as it is not a functional requirement.

   

end
