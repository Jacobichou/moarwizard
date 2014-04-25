class User < ActiveRecord::Base
   has_many :messages
   has_many :charts
   has_many :reports
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
end
