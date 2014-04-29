class User < ActiveRecord::Base
   has_many :messages
   has_many :charts
   has_many :reports
   has_many :appointments

   # ROLES:
      # -1  = inactive
      # 1   = patient
      # 30  = receptionist
      # 50  = nurse
      # 60  = pa
      # 66  = doctor
      # 90  = lab
      # 100 = admin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   def feed
      Message.where("recipient_id = ?", id)
   end

   def feed_sent
     Message.where("user_id = ?", id)
   end

   def chart_feed
      Chart.where("user_id = ?", id)
   end

   def get_name
      "#{full_name}"
      # "#{full_name}" if role == 60 || role == 66
   end
end
